Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6860D7E8149
	for <lists+linux-watchdog@lfdr.de>; Fri, 10 Nov 2023 19:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345466AbjKJS1K (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 10 Nov 2023 13:27:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235772AbjKJSZ2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 10 Nov 2023 13:25:28 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1B3338E88
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Nov 2023 06:20:57 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9ae2cc4d17eso353257966b.1
        for <linux-watchdog@vger.kernel.org>; Fri, 10 Nov 2023 06:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699626056; x=1700230856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=761wTJXmJIbVemMGzSxPZy0DOYERpf+XUIdDq0AchnA=;
        b=pqiakeMMTwKo1aCCoEbeaOrImUtGeVv7n3DnL3UiTtUxSJ9syB3PrOhc6Opq2WKT/w
         lEpNjn7vd3iQz3RFOk51Ic/HyuzsMAvvGnXIjHAdauh82O+D+9NPriudOiSqjFKlf36v
         5QzXAwFLve9rNz6ltlYjsiGHvD/+SahJb7dZ9o6RmSb9+0RJeDUoZPFPmnwnHBx353yo
         iLGG3+8afVnZ8CshDnq0JLYkud1RPNnPWqj9a7r9KVVEera8hlUGt+RVRd3luHTBUiAC
         UFXEvToK9pqgd2nFdOLevpz1SabB9jhx1SNp7Vm1saso3jBetc0RXnXmMKujn+k/TW6S
         nxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699626056; x=1700230856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=761wTJXmJIbVemMGzSxPZy0DOYERpf+XUIdDq0AchnA=;
        b=Wf/EAOZwgTMHmdGunQFoLc9akW7ZOeyrzySodbhCOQk2N1FemKO68w2P7BEfn12cCZ
         abrBk6HUDprGoYMA4QoEZrLGhCjd5QGryD7yVqnUQJ9suxNPMn/UP1QIO7QZQ7d2dBVA
         oDBK8kiIuAvSE3fl+SozJPzhkd+GG8h2uZH5IUAIaXPN77kqbfUWs8eFMHlWIdoTT1aa
         ONV+aKySat0Ij1n/UkeA4DB/I/IB7Hk03uB8tOxzmsv21dM7pQwZ3FVuEjI4C53qw2M8
         0lfA/MRS+4yzVrD8AB2y+kiP8N3uUwvcgHlpnZAxn2kcsCj/nl39z1UYuBtoZD38mc5e
         1HdA==
X-Gm-Message-State: AOJu0YzIGS21JwXCmqZkxlzRTZwY8ccE/W/fG/yjaFDQyT4MvisYyVQc
        fpmOsIYOySOcSMP3cgpScACQ5A==
X-Google-Smtp-Source: AGHT+IFQpAra7PVuRUcOCF76pQsBdsA1UCxiXsX1n+SA8KD+0EUmEcqN2Ohj/s2kN80zUUCovtMbOg==
X-Received: by 2002:a17:907:940d:b0:9bd:e3ae:ef57 with SMTP id dk13-20020a170907940d00b009bde3aeef57mr6031060ejc.60.1699626056188;
        Fri, 10 Nov 2023 06:20:56 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id dk4-20020a170907940400b009e67c32050dsm635789ejc.44.2023.11.10.06.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Nov 2023 06:20:55 -0800 (PST)
Message-ID: <d7b72b3e-c8f4-4675-ae62-26f5ae576f0a@linaro.org>
Date:   Fri, 10 Nov 2023 15:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: mediatek,mtk-wdt: add MT7988
 watchdog and toprgu
Content-Language: en-US
To:     Daniel Golle <daniel@makrotopia.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <6912f6f406bc45674020681184f3eeca2f2cb63f.1699576174.git.daniel@makrotopia.org>
 <2678cb48-1d2b-47bc-9272-06d9aa140c58@collabora.com>
 <ZU47hV1i66WN8nZJ@makrotopia.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzTRLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+wsGUBBMBCgA+FiEE
 m9B+DgxR+NWWd7dUG5NDfTtBYpsFAmI+BxMCGwMFCRRfreEFCwkIBwIGFQoJCAsCBBYCAwEC
 HgECF4AACgkQG5NDfTtBYptgbhAAjAGunRoOTduBeC7V6GGOQMYIT5n3OuDSzG1oZyM4kyvO
 XeodvvYv49/ng473E8ZFhXfrre+c1olbr1A8pnz9vKVQs9JGVa6wwr/6ddH7/yvcaCQnHRPK
 mnXyP2BViBlyDWQ71UC3N12YCoHE2cVmfrn4JeyK/gHCvcW3hUW4i5rMd5M5WZAeiJj3rvYh
 v8WMKDJOtZFXxwaYGbvFJNDdvdTHc2x2fGaWwmXMJn2xs1ZyFAeHQvrp49mS6PBQZzcx0XL5
 cU9ZjhzOZDn6Apv45/C/lUJvPc3lo/pr5cmlOvPq1AsP6/xRXsEFX/SdvdxJ8w9KtGaxdJuf
 rpzLQ8Ht+H0lY2On1duYhmro8WglOypHy+TusYrDEry2qDNlc/bApQKtd9uqyDZ+rx8bGxyY
 qBP6bvsQx5YACI4p8R0J43tSqWwJTP/R5oPRQW2O1Ye1DEcdeyzZfifrQz58aoZrVQq+innR
 aDwu8qDB5UgmMQ7cjDSeAQABdghq7pqrA4P8lkA7qTG+aw8Z21OoAyZdUNm8NWJoQy8m4nUP
 gmeeQPRc0vjp5JkYPgTqwf08cluqO6vQuYL2YmwVBIbO7cE7LNGkPDA3RYMu+zPY9UUi/ln5
 dcKuEStFZ5eqVyqVoZ9eu3RTCGIXAHe1NcfcMT9HT0DPp3+ieTxFx6RjY3kYTGLOwU0EVUNc
 NAEQAM2StBhJERQvgPcbCzjokShn0cRA4q2SvCOvOXD+0KapXMRFE+/PZeDyfv4dEKuCqeh0
 hihSHlaxTzg3TcqUu54w2xYskG8Fq5tg3gm4kh1Gvh1LijIXX99ABA8eHxOGmLPRIBkXHqJY
 oHtCvPc6sYKNM9xbp6I4yF56xVLmHGJ61KaWKf5KKWYgA9kfHufbja7qR0c6H79LIsiYqf92
 H1HNq1WlQpu/fh4/XAAaV1axHFt/dY/2kU05tLMj8GjeQDz1fHas7augL4argt4e+jum3Nwt
 yupodQBxncKAUbzwKcDrPqUFmfRbJ7ARw8491xQHZDsP82JRj4cOJX32sBg8nO2N5OsFJOcd
 5IE9v6qfllkZDAh1Rb1h6DFYq9dcdPAHl4zOj9EHq99/CpyccOh7SrtWDNFFknCmLpowhct9
 5ZnlavBrDbOV0W47gO33WkXMFI4il4y1+Bv89979rVYn8aBohEgET41SpyQz7fMkcaZU+ok/
 +HYjC/qfDxT7tjKXqBQEscVODaFicsUkjheOD4BfWEcVUqa+XdUEciwG/SgNyxBZepj41oVq
 FPSVE+Ni2tNrW/e16b8mgXNngHSnbsr6pAIXZH3qFW+4TKPMGZ2rZ6zITrMip+12jgw4mGjy
 5y06JZvA02rZT2k9aa7i9dUUFggaanI09jNGbRA/ABEBAAHCwXwEGAEKACYCGwwWIQSb0H4O
 DFH41ZZ3t1Qbk0N9O0FimwUCYDzvagUJFF+UtgAKCRAbk0N9O0Fim9JzD/0auoGtUu4mgnna
 oEEpQEOjgT7l9TVuO3Qa/SeH+E0m55y5Fjpp6ZToc481za3xAcxK/BtIX5Wn1mQ6+szfrJQ6
 59y2io437BeuWIRjQniSxHz1kgtFECiV30yHRgOoQlzUea7FgsnuWdstgfWi6LxstswEzxLZ
 Sj1EqpXYZE4uLjh6dW292sO+j4LEqPYr53hyV4I2LPmptPE9Rb9yCTAbSUlzgjiyyjuXhcwM
 qf3lzsm02y7Ooq+ERVKiJzlvLd9tSe4jRx6Z6LMXhB21fa5DGs/tHAcUF35hSJrvMJzPT/+u
 /oVmYDFZkbLlqs2XpWaVCo2jv8+iHxZZ9FL7F6AHFzqEFdqGnJQqmEApiRqH6b4jRBOgJ+cY
 qc+rJggwMQcJL9F+oDm3wX47nr6jIsEB5ZftdybIzpMZ5V9v45lUwmdnMrSzZVgC4jRGXzsU
 EViBQt2CopXtHtYfPAO5nAkIvKSNp3jmGxZw4aTc5xoAZBLo0OV+Ezo71pg3AYvq0a3/oGRG
 KQ06ztUMRrj8eVtpImjsWCd0bDWRaaR4vqhCHvAG9iWXZu4qh3ipie2Y0oSJygcZT7H3UZxq
 fyYKiqEmRuqsvv6dcbblD8ZLkz1EVZL6djImH5zc5x8qpVxlA0A0i23v5QvN00m6G9NFF0Le
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZU47hV1i66WN8nZJ@makrotopia.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/11/2023 15:17, Daniel Golle wrote:
> On Fri, Nov 10, 2023 at 12:56:18PM +0100, AngeloGioacchino Del Regno wrote:
>> Il 10/11/23 01:30, Daniel Golle ha scritto:
>>> Add binding description for mediatek,mt7988-wdt.
>>>
>>> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>>> ---
>>>   .../bindings/watchdog/mediatek,mtk-wdt.yaml          |  1 +
>>>   include/dt-bindings/reset/mediatek,mt7988-resets.h   | 12 ++++++++++++
>>>   2 files changed, 13 insertions(+)
>>>   create mode 100644 include/dt-bindings/reset/mediatek,mt7988-resets.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>>> index cc502838bc398..8d2520241e37f 100644
>>> --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>>> +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
>>> @@ -25,6 +25,7 @@ properties:
>>>             - mediatek,mt6735-wdt
>>>             - mediatek,mt6795-wdt
>>>             - mediatek,mt7986-wdt
>>> +          - mediatek,mt7988-wdt
>>>             - mediatek,mt8183-wdt
>>>             - mediatek,mt8186-wdt
>>>             - mediatek,mt8188-wdt
>>> diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
>>> new file mode 100644
>>> index 0000000000000..fa7c937505e08
>>> --- /dev/null
>>> +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
>>> @@ -0,0 +1,12 @@
>>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>>> +
>>> +/* TOPRGU resets */
>>
>> The first reset is zero, the second reset is one.
>>
>> Where's the zero'th reset? :-)
> 
> Currently the reset numbers represent the corresponding bit positions in
> the toprgu register, as this is how the mtk-wdt driver is organized.
> 
> So there is probably something at bit 0, and also at bit 3~11 and
> maybe also 17~23, but it's unknown and may be added later once known
> and/or needed.

There is no need to put register bits, which are not used by the driver,
in the bindings.

Best regards,
Krzysztof

