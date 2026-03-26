# Protocol Documentation
<a name="top"></a>

## Table of Contents

- [techmo/asr/api/v1/asr.proto](#techmo_asr_api_v1_asr-proto)
    - [AgeRecognitionAlternative](#techmo-asr-api-v1-AgeRecognitionAlternative)
    - [AgeRecognitionConfig](#techmo-asr-api-v1-AgeRecognitionConfig)
    - [AgeRecognitionResult](#techmo-asr-api-v1-AgeRecognitionResult)
    - [Audio](#techmo-asr-api-v1-Audio)
    - [AudioConfig](#techmo-asr-api-v1-AudioConfig)
    - [GenderRecognitionAlternative](#techmo-asr-api-v1-GenderRecognitionAlternative)
    - [GenderRecognitionConfig](#techmo-asr-api-v1-GenderRecognitionConfig)
    - [GenderRecognitionResult](#techmo-asr-api-v1-GenderRecognitionResult)
    - [LanguageRecognitionAlternative](#techmo-asr-api-v1-LanguageRecognitionAlternative)
    - [LanguageRecognitionConfig](#techmo-asr-api-v1-LanguageRecognitionConfig)
    - [LanguageRecognitionResult](#techmo-asr-api-v1-LanguageRecognitionResult)
    - [ResultConfig](#techmo-asr-api-v1-ResultConfig)
    - [SpeechRecognitionAlternative](#techmo-asr-api-v1-SpeechRecognitionAlternative)
    - [SpeechRecognitionConfig](#techmo-asr-api-v1-SpeechRecognitionConfig)
    - [SpeechRecognitionConfig.ConfigFieldsEntry](#techmo-asr-api-v1-SpeechRecognitionConfig-ConfigFieldsEntry)
    - [SpeechRecognitionResult](#techmo-asr-api-v1-SpeechRecognitionResult)
    - [SpeechRecognitionWord](#techmo-asr-api-v1-SpeechRecognitionWord)
    - [StreamingConfig](#techmo-asr-api-v1-StreamingConfig)
    - [StreamingRecognizeRequest](#techmo-asr-api-v1-StreamingRecognizeRequest)
    - [StreamingRecognizeRequestConfig](#techmo-asr-api-v1-StreamingRecognizeRequestConfig)
    - [StreamingRecognizeRequestControlMessage](#techmo-asr-api-v1-StreamingRecognizeRequestControlMessage)
    - [StreamingRecognizeRequestData](#techmo-asr-api-v1-StreamingRecognizeRequestData)
    - [StreamingRecognizeResponse](#techmo-asr-api-v1-StreamingRecognizeResponse)
    - [StreamingRecognizeResult](#techmo-asr-api-v1-StreamingRecognizeResult)

    - [AudioConfig.AudioEncoding](#techmo-asr-api-v1-AudioConfig-AudioEncoding)
    - [StreamingRecognizeResult.ResultFinalizationCause](#techmo-asr-api-v1-StreamingRecognizeResult-ResultFinalizationCause)

    - [Asr](#techmo-asr-api-v1-Asr)

- [Scalar Value Types](#scalar-value-types)



<a name="techmo_asr_api_v1_asr-proto"></a>
<p align="right"><a href="#top">Top</a></p>

## techmo/asr/api/v1/asr.proto



<a name="techmo-asr-api-v1-AgeRecognitionAlternative"></a>

### AgeRecognitionAlternative
An alternative hypothesis of age recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| age | [uint32](#uint32) |  | The assumed age of the person speaking in the audio, in years. For a reliable value, assure that there is only one person speaking in the audio. |
| confidence | [float](#float) | optional | The confidence estimate, ranging from 0.0 to 1.0. Support for this feature is optional. |






<a name="techmo-asr-api-v1-AgeRecognitionConfig"></a>

### AgeRecognitionConfig
Configuration of age recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enable_age_recognition | [bool](#bool) |  | The switch that enables age recognition for the request. If disabled or unspecified, the related results are excluded. The service responds with the `FAILED_PRECONDITION` gRPC status code if requested but not enabled. |






<a name="techmo-asr-api-v1-AgeRecognitionResult"></a>

### AgeRecognitionResult
A result of age recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [techmo.api.Status](#techmo-api-Status) |  | The recognition process status. It may communicate warnings. In case of an error hindering recognition, all other message fields should be left unset. |
| recognition_alternatives | [AgeRecognitionAlternative](#techmo-asr-api-v1-AgeRecognitionAlternative) | repeated | The confidence-ordered list of alternative recognition hypotheses. |






<a name="techmo-asr-api-v1-Audio"></a>

### Audio
Audio contents.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| bytes | [bytes](#bytes) |  | The audio data bytes. |






<a name="techmo-asr-api-v1-AudioConfig"></a>

### AudioConfig
Audio configuration of
a [`StreamingRecognize`](#StreamingRecognize) request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| encoding | [AudioConfig.AudioEncoding](#techmo-asr-api-v1-AudioConfig-AudioEncoding) |  | The encoding of the audio data sent in the request. Single channel (mono) audio is assumed. The service should respond with the `INVALID_ARGUMENT` gRPC status code if the encoding is `UNSPECIFIED`. The service should respond with the `FAILED_PRECONDITION` gRPC status code if the encoding is not supported. |
| sampling_rate_hz | [float](#float) |  | The sampling rate of the audio data sent in the request. The service should silently ignore the field for encodings that are sent along wtih headers, and detect the value from them instead. The service should respond with the `INVALID_ARGUMENT` gRPC status code if the value is not greater than 0. |






<a name="techmo-asr-api-v1-GenderRecognitionAlternative"></a>

### GenderRecognitionAlternative
An alternative hypothesis of gender recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| gender | [string](#string) |  | The assumed gender of the person speaking in the audio. For a reliable value, assure that there is only one person speaking in the audio. |
| confidence | [float](#float) | optional | The confidence estimate, ranging from 0.0 to 1.0. Support for this feature is optional. |






<a name="techmo-asr-api-v1-GenderRecognitionConfig"></a>

### GenderRecognitionConfig
Configuration of gender recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enable_gender_recognition | [bool](#bool) |  | The switch that enables gender recognition for the request. If disabled or unspecified, the related results are excluded. The service responds with the `FAILED_PRECONDITION` gRPC status code if requested but not enabled. |






<a name="techmo-asr-api-v1-GenderRecognitionResult"></a>

### GenderRecognitionResult
A result of gender recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [techmo.api.Status](#techmo-api-Status) |  | The recognition process status. It may communicate warnings. In case of an error hindering recognition, all other message fields should be left unset. |
| recognition_alternatives | [GenderRecognitionAlternative](#techmo-asr-api-v1-GenderRecognitionAlternative) | repeated | The confidence-ordered list of alternative recognition hypotheses. |






<a name="techmo-asr-api-v1-LanguageRecognitionAlternative"></a>

### LanguageRecognitionAlternative
An alternative hypothesis of language recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| language | [string](#string) |  | The language spoken in the audio, a [BCP-47](https://www.rfc-editor.org/rfc/bcp/bcp47.txt) tag. |
| confidence | [float](#float) | optional | The confidence estimate, ranging from 0.0 to 1.0. Support for this feature is optional. |






<a name="techmo-asr-api-v1-LanguageRecognitionConfig"></a>

### LanguageRecognitionConfig
Configuration of language recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enable_language_recognition | [bool](#bool) |  | The switch that enables language recognition for the request. If disabled or unspecified, the related results are excluded. The service responds with the `FAILED_PRECONDITION` gRPC status code if requested but not enabled. |






<a name="techmo-asr-api-v1-LanguageRecognitionResult"></a>

### LanguageRecognitionResult
A result of language recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [techmo.api.Status](#techmo-api-Status) |  | The recognition process status. It may communicate warnings. In case of an error hindering recognition, all other message fields should be left unset. |
| recognition_alternatives | [LanguageRecognitionAlternative](#techmo-asr-api-v1-LanguageRecognitionAlternative) | repeated | The confidence-ordered list of alternative recognition hypotheses. |






<a name="techmo-asr-api-v1-ResultConfig"></a>

### ResultConfig
Result configuration of
a [`StreamingRecognize`](#StreamingRecognize) request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enable_single_utterance | [bool](#bool) |  | The switch that toggles continuous recognition into single utterance mode. The service returns a final result for each end of utterance it detects in the audio, which may occur multiple times during a request. If enabled, the request terminates right after its first final result. |
| enable_interim_results | [bool](#bool) |  | The switch that allows interim results. If enabled, results containing tentative hypotheses may be returned in addition to final ones. The service should silently ignore this field if it is unsupported. |






<a name="techmo-asr-api-v1-SpeechRecognitionAlternative"></a>

### SpeechRecognitionAlternative
An alternative hypothesis of speech recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcript | [string](#string) |  | The transcript of the audio. |
| confidence | [float](#float) | optional | The confidence estimate, ranging from 0.0 to 1.0. Support for this feature is optional. |
| words | [SpeechRecognitionWord](#techmo-asr-api-v1-SpeechRecognitionWord) | repeated | The details of the transcript&#39;s words. Empty unless `enable_time_alignment` is `true` in the request&#39;s [`SpeechRecognitionConfig`](#SpeechRecognitionConfig). |






<a name="techmo-asr-api-v1-SpeechRecognitionConfig"></a>

### SpeechRecognitionConfig
Configuration for speech recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enable_speech_recognition | [bool](#bool) |  | The switch that enables speech recognition for the request. If disabled or unspecified, the related results are excluded. The service responds with the `FAILED_PRECONDITION` gRPC status code if requested but not enabled. |
| recognition_alternatives_limit | [uint32](#uint32) |  | The maximum number of alternative transcriptions allowed to be included per response. The actual count received can be less than the specified value and may also be equal to 0. If unspecified or 0, one alternative is allowed to be returned too. |
| enable_time_alignment | [bool](#bool) |  | The switch that enables additional time alignment of recognitions in word details. If enabled, the `words` field of a [`SpeechRecognitionAlternative`](#SpeechRecognitionAlternative) message includes a list of [`SpeechRecognitionWord`](#SpeechRecognitionWord) messages. Otherwise, it remains empty. The service responds with the `FAILED_PRECONDITION` gRPC status code if requested but not enabled. |
| language_group_name | [string](#string) |  | The name of a language group of models to be used. If left unspecified, it backs to the service&#39;s default group. The service responds with the `NOT_FOUND` gRPC status code if the name is not registered. |
| model_name | [string](#string) |  | The name of a model to be used. If left unspecified, it backs to the selected langugage group&#39;s default. The service responds with the `NOT_FOUND` gRPC status code if the name is not registered. |
| config_fields | [SpeechRecognitionConfig.ConfigFieldsEntry](#techmo-asr-api-v1-SpeechRecognitionConfig-ConfigFieldsEntry) | repeated | Deprecated. The additional advanced service-dependend configuration for its speech recognizer. It may be silently ignored. |






<a name="techmo-asr-api-v1-SpeechRecognitionConfig-ConfigFieldsEntry"></a>

### SpeechRecognitionConfig.ConfigFieldsEntry



| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| key | [string](#string) |  |  |
| value | [string](#string) |  |  |






<a name="techmo-asr-api-v1-SpeechRecognitionResult"></a>

### SpeechRecognitionResult
A result of speech recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [techmo.api.Status](#techmo-api-Status) |  | The recognition process status. It may communicate warnings. In case of an error hindering recognition, all other message fields should be left unset. |
| recognition_alternatives | [SpeechRecognitionAlternative](#techmo-asr-api-v1-SpeechRecognitionAlternative) | repeated | The confidence-ordered list of alternative recognition hypotheses. |
| language_group_name | [string](#string) |  | The actual name of the language group of the model, unrelated to the actual language spoken in the audio. |
| model_name | [string](#string) |  | The actual name of the model used to obtain the result. |






<a name="techmo-asr-api-v1-SpeechRecognitionWord"></a>

### SpeechRecognitionWord
Details of a single word in speech recognition.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| transcript | [string](#string) |  | The transcript of the word itself. |
| confidence | [float](#float) | optional | The confidence estimate, ranging from 0.0 to 1.0. Support for this feature is optional. |
| start_time | [google.protobuf.Duration](#google-protobuf-Duration) |  | The start time of the word relative to the beginning of the entire audio. |
| end_time | [google.protobuf.Duration](#google-protobuf-Duration) |  | The end time of the word relative to the beginning of the entire audio. |






<a name="techmo-asr-api-v1-StreamingConfig"></a>

### StreamingConfig
Streaming configuration of
a [`StreamingRecognize`](#StreamingRecognize) request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| enable_manual_input_timer | [bool](#bool) |  | The switch that enables manual control of the input timer. The timer imposes two constraints: one that finalizes recognition after a specified period unless speech is detected, and the other that limits the total time for an utterance. Manual control allows recognition to begin but delays enforcement of these constraints. The timer restarts after each detected end of utterance (each final result). If enabled, the timer does not start automatically. Instead, it can be initiated by sending a [`StreamingRecognizeRequestControlMessage`](#StreamingRecognizeRequestControlMessage) with the `start_input_timer` field set to `true` as needed. This should occur after the beginning of the request and be repeated after each final result. |






<a name="techmo-asr-api-v1-StreamingRecognizeRequest"></a>

### StreamingRecognizeRequest
A message streamed from the client through
the [`StreamingRecognize`](#StreamingRecognize) method.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| config | [StreamingRecognizeRequestConfig](#techmo-asr-api-v1-StreamingRecognizeRequestConfig) |  | The immutable initial configuration of the request. Must be sent once in the request&#39;s first message. |
| control_message | [StreamingRecognizeRequestControlMessage](#techmo-asr-api-v1-StreamingRecognizeRequestControlMessage) |  | The message controlling the processing flow of the request. May be sent multiple times except in the request&#39;s first message. |
| data | [StreamingRecognizeRequestData](#techmo-asr-api-v1-StreamingRecognizeRequestData) |  | The data contents of the request itself. May be sent multiple times except in the request&#39;s first message. |






<a name="techmo-asr-api-v1-StreamingRecognizeRequestConfig"></a>

### StreamingRecognizeRequestConfig
A message holding configuration of
a [`StreamingRecognize`](#StreamingRecognize) request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| audio_config | [AudioConfig](#techmo-asr-api-v1-AudioConfig) |  | Part of the configuration for the request&#39;s audio content. |
| result_config | [ResultConfig](#techmo-asr-api-v1-ResultConfig) |  | Part of the configuration for the request&#39;s result form. |
| streaming_config | [StreamingConfig](#techmo-asr-api-v1-StreamingConfig) |  | Part of the configuration for the request&#39;s processing flow. |
| speech_recognition_config | [SpeechRecognitionConfig](#techmo-asr-api-v1-SpeechRecognitionConfig) |  | Part of the configuration for speech recognition. |
| age_recognition_config | [AgeRecognitionConfig](#techmo-asr-api-v1-AgeRecognitionConfig) |  | Part of the configuration for age recognition. |
| gender_recognition_config | [GenderRecognitionConfig](#techmo-asr-api-v1-GenderRecognitionConfig) |  | Part of the configuration for gender recognition. |
| language_recognition_config | [LanguageRecognitionConfig](#techmo-asr-api-v1-LanguageRecognitionConfig) |  | Part of the configuration for language recognition. |






<a name="techmo-asr-api-v1-StreamingRecognizeRequestControlMessage"></a>

### StreamingRecognizeRequestControlMessage
A message controlling the processing flow of
a [`StreamingRecognize`](#StreamingRecognize) request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| start_input_timer | [bool](#bool) | optional | The flag that starts the input timer on demand and resets after each final result. It is silently ignored if the manual input timer setting is disabled for the request. |






<a name="techmo-asr-api-v1-StreamingRecognizeRequestData"></a>

### StreamingRecognizeRequestData
A message that carries data contents of
a [`StreamingRecognizeRequest`](#StreamingRecognizeRequest) request.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| audio | [Audio](#techmo-asr-api-v1-Audio) |  | Part of the audio to perform recognition on. |






<a name="techmo-asr-api-v1-StreamingRecognizeResponse"></a>

### StreamingRecognizeResponse
A message streamed from the service through
the [`StreamingRecognize`](#StreamingRecognize) method.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| result | [StreamingRecognizeResult](#techmo-asr-api-v1-StreamingRecognizeResult) |  | The combined recognition results for another part of the audio. |
| processed_audio_duration | [google.protobuf.Duration](#google-protobuf-Duration) |  | The cumulative duration of the processed audio during the request, not necessarily matching the actual length of the sent audio, mandatorily updated with each final result. |






<a name="techmo-asr-api-v1-StreamingRecognizeResult"></a>

### StreamingRecognizeResult
Combined recognition result.


| Field | Type | Label | Description |
| ----- | ---- | ----- | ----------- |
| error | [techmo.api.Status](#techmo-api-Status) |  | The recognition process status. It may communicate warnings. In case of an error hindering recognition, all other message fields should be left unset. |
| is_final | [bool](#bool) |  | The flag indicating whether the result is interim or final. |
| result_finalization_cause | [StreamingRecognizeResult.ResultFinalizationCause](#techmo-asr-api-v1-StreamingRecognizeResult-ResultFinalizationCause) |  | The field indicating the cause of result finalization. For interim results, the service should leave the field as `UNSPECIFIED`. For final results, the service must set the field to a value other than `UNSPECIFIED`. |
| speech_recognition_result | [SpeechRecognitionResult](#techmo-asr-api-v1-SpeechRecognitionResult) |  | The speech recognition result for another part of the processed audio, new with each final result, updates with each interim one. To obtain a complete result for all processed audio, for each final result received, a client should pick one of the result&#39;s recognition alternatives and buffer it on its own. It must be omitted if speech recognition is disabled. |
| age_recognition_result | [AgeRecognitionResult](#techmo-asr-api-v1-AgeRecognitionResult) |  | The current age recognition result for all processed audio, updated with each final result. It may be omitted in an interim result and must be omitted if age recognition is disabled. |
| gender_recognition_result | [GenderRecognitionResult](#techmo-asr-api-v1-GenderRecognitionResult) |  | The current gender recognition result for all processed audio, updated with each final result. It may be omitted in an interim result and must be omitted if gender recognition is disabled. |
| language_recognition_result | [LanguageRecognitionResult](#techmo-asr-api-v1-LanguageRecognitionResult) |  | The current language recognition result for all processed audio, updated with each final result. It may be omitted in an interim result and must be omitted if language recognition is disabled. |








<a name="techmo-asr-api-v1-AudioConfig-AudioEncoding"></a>

### AudioConfig.AudioEncoding
The possible audio encodings.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED | 0 | Unspecified audio encoding. |
| LINEAR16 | 1 | Linear pulse-code modulation of uncompressed 16-bit signed little-endian samples. |
| FLAC | 2 | Free Lossless Audio Codec ([FLAC](https://wiki.xiph.org/FLAC)). The encoding requires only about half the bandwidth of `LINEAR16`. 16-bit and 24-bit samples. Not all fields in `STREAMINFO` are supported. When set, the service ignores the `sampling_rate_hz` field and detects the actual value from audio header instead. |
| OGG_OPUS | 6 | Ogg Encapsulated Opus Audio Codec ([OggOpus](https://wiki.xiph.org/OggOpus)). When set, the service ignores the `sampling_rate_hz` field and detects the actual value from audio header instead. |
| MP3 | 8 | MP3 (ISO/IEC 11172-3 and ISO/IEC 13818-3). Only constant bitrate. When set, the service ignores the `sampling_rate_hz` field and detects the actual value from audio header instead. |



<a name="techmo-asr-api-v1-StreamingRecognizeResult-ResultFinalizationCause"></a>

### StreamingRecognizeResult.ResultFinalizationCause
The anticipated causes for the service to finalize a result.

| Name | Number | Description |
| ---- | ------ | ----------- |
| UNSPECIFIED | 0 | The cause is not specified. |
| SUCCESS | 1 | The speech recognition result is not empty and the end of utterance is detected. |
| NO_INPUT_TIMEOUT | 2 | The speech recognition result is empty after the duration to expect a result is reached. |
| SUCCESS_MAXTIME | 3 | The speech recognition result is not empty after the utterance duration limit is reached. The returned speech recognition is incomplete and should be completed in the following result. |
| PARTIAL_MATCH | 4 | Unused. |
| NO_MATCH_MAXTIME | 5 | The speech recognition result is empty after the utterance duration limit is reached. |







<a name="techmo-asr-api-v1-Asr"></a>

### Asr
An automatic speech recognition (ASR) service providing a solution for
speech-to-text conversion extended by the assessment of additional speech
and speaker features.

| Method Name | Request Type | Response Type | Description |
| ----------- | ------------ | ------------- | ------------|
| StreamingRecognize | [StreamingRecognizeRequest](#techmo-asr-api-v1-StreamingRecognizeRequest) stream | [StreamingRecognizeResponse](#techmo-asr-api-v1-StreamingRecognizeResponse) stream | Perform bidirectional streaming recognition. |





## Scalar Value Types

| .proto Type | Notes | C++ | Java | Python | Go | C# | PHP | Ruby |
| ----------- | ----- | --- | ---- | ------ | -- | -- | --- | ---- |
| <a name="double" /> double |  | double | double | float | float64 | double | float | Float |
| <a name="float" /> float |  | float | float | float | float32 | float | float | Float |
| <a name="int32" /> int32 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint32 instead. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="int64" /> int64 | Uses variable-length encoding. Inefficient for encoding negative numbers – if your field is likely to have negative values, use sint64 instead. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="uint32" /> uint32 | Uses variable-length encoding. | uint32 | int | int/long | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="uint64" /> uint64 | Uses variable-length encoding. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum or Fixnum (as required) |
| <a name="sint32" /> sint32 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int32s. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sint64" /> sint64 | Uses variable-length encoding. Signed int value. These more efficiently encode negative numbers than regular int64s. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="fixed32" /> fixed32 | Always four bytes. More efficient than uint32 if values are often greater than 2^28. | uint32 | int | int | uint32 | uint | integer | Bignum or Fixnum (as required) |
| <a name="fixed64" /> fixed64 | Always eight bytes. More efficient than uint64 if values are often greater than 2^56. | uint64 | long | int/long | uint64 | ulong | integer/string | Bignum |
| <a name="sfixed32" /> sfixed32 | Always four bytes. | int32 | int | int | int32 | int | integer | Bignum or Fixnum (as required) |
| <a name="sfixed64" /> sfixed64 | Always eight bytes. | int64 | long | int/long | int64 | long | integer/string | Bignum |
| <a name="bool" /> bool |  | bool | boolean | boolean | bool | bool | boolean | TrueClass/FalseClass |
| <a name="string" /> string | A string must always contain UTF-8 encoded or 7-bit ASCII text. | string | String | str/unicode | string | string | string | String (UTF-8) |
| <a name="bytes" /> bytes | May contain any arbitrary sequence of bytes. | string | ByteString | str | []byte | ByteString | string | String (ASCII-8BIT) |
