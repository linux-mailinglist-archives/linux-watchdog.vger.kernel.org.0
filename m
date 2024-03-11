Return-Path: <linux-watchdog+bounces-772-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9BF877B14
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Mar 2024 07:50:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 64E7F282392
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Mar 2024 06:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71B6CFC17;
	Mon, 11 Mar 2024 06:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nh4U4Fe8"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D39F9E6
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Mar 2024 06:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710139828; cv=none; b=tHvp/X+9JbVIwS3vvPNtaWjMN0RJX1m24nBpc3v2KO4eZVgNsyMeKv9tpZryeAFBGcQ47vyj6HTsiNU1/nORhe10CufZk89b3j2zvC0BQinM2qpO1WTmcBh++7UXDKYu/IldvAB0Ay5SNOm/kZcY7Ae1n+TGJJvdM1R6jJY7rYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710139828; c=relaxed/simple;
	bh=kMMHWHsVeMooooSXExdq3OzKqJPtV/KRYk1xvQmfLdw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PB0WD3ZBpjRgCVAC8RNlayELgbYvZ+znJLcslprDVD34ifNUpeQQkBUy7Ls2MnavNeCmHzYmnbkq9rpc5O5DUl91NAAtkUeE4nfjJ4H7oAXCduC4MX03CKUcCTU9PDryI0M55NXbj02wcUKWfQBuXusQ5vnHY2A0dbrOc52okDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nh4U4Fe8; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d094bc2244so61764051fa.1
        for <linux-watchdog@vger.kernel.org>; Sun, 10 Mar 2024 23:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710139825; x=1710744625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFx82oD96JfZcte/AwcSqFIzsVxyk8Oe1JgVwAOV2zU=;
        b=Nh4U4Fe88kMcF0Z3uJR8NoXSvhJxiMmKKjhJmBPK6lHDkbJmnbtTnNgza4SbauL7un
         fF89Z6Wc5a/5dycCvQf0//jFf5kJKQzc6eQvJ9fnbzGimVjJ/StW7Q94CnY41FKXkxkg
         TbopDwxgXsmJE3Q6ERqdwKHVH1jdG59bo8wEeVSYBE1xHpVHZWChGTA4eG8T4tX2wCMj
         7lcTVgv1UYjbc8qGMB6nlXikB3tISrfK2NmzGUKyhj5BZwWLqqL2bgnW717OiGesJKkI
         TsAP+6/CemA1LvKihft3tEqIIlPfnH+Kqsr1aa8m1gb/bF16aik+4JKyYFn/GArjbRC2
         EhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710139825; x=1710744625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFx82oD96JfZcte/AwcSqFIzsVxyk8Oe1JgVwAOV2zU=;
        b=tdlhbIIaxTi0pflpjzWfe1V+MWKCoGN7zlK69rTWZniPE8ejvdBNcvibEUz+4G0Uq2
         dQxonZqo/+k2CZhicajj/UAum6/xiXemlyiasaoHeISC7It7n8d2OgEkekqHiCnvl4GI
         GwFTCLaGwS9cwxN558HsyFwo5hc7wvMCPSzUFTyG9JD6jAjp4e6imT5GYx24LNKcm5Jx
         BsGFV2spDq1+JX/8JFn0/vJvoIYCA/C1R5iisBKd8F0wyItTQp856jzOisitQiu6oO5u
         RkPsqYKG7jhE8OvLQeEqcnOWhADxBfKk+0lNMRupF0uqluhr6DrA2QQqjMbTLfW2lYpn
         FvtA==
X-Forwarded-Encrypted: i=1; AJvYcCWFFAfzGh7UPZrEL7h7o1y3xkBWQpxBMTDWB+nc6jlJK1Y1kSkw7allINbZ6lk5AWUcLmkZ8rtJJ8GQG5nxzmxqaxBML+9OhoZN8P8evVU=
X-Gm-Message-State: AOJu0YzqNQg5jtG4FWFfEp5QY7CLITzNxEQDtNle1ugtHnfWcoKlsBKB
	4TU+MWL2L63RdEQxBDf7Av3PBLNlJI04g3F4E4oqEAPdsXr126xotEdnvaYOEFk=
X-Google-Smtp-Source: AGHT+IGO1UwGe9IvtCiUP8qTbZqbE1nTvW/tAmQxde1dAgChlWJ9G5Fe1ECkajHs0KSOQzNAu655Ng==
X-Received: by 2002:a2e:a37a:0:b0:2d2:acef:6aca with SMTP id i26-20020a2ea37a000000b002d2acef6acamr2936055ljn.41.1710139824642;
        Sun, 10 Mar 2024 23:50:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id et8-20020a056402378800b00566a4dec01fsm2619934edb.11.2024.03.10.23.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Mar 2024 23:50:24 -0700 (PDT)
Message-ID: <c7693ae1-b7e4-4960-b447-8373855d86b5@linaro.org>
Date: Mon, 11 Mar 2024 07:50:22 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/4] ARM: dts: wpcm450: Remove clock-output-names from
 reference clock node
Content-Language: en-US
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 linux-clk@vger.kernel.org, openbmc@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240310192108.2747084-1-j.neuschaefer@gmx.net>
 <20240310192108.2747084-3-j.neuschaefer@gmx.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20240310192108.2747084-3-j.neuschaefer@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/03/2024 20:21, Jonathan Neuschäfer wrote:
> This is not necessary anymore, because the clk-wpcm450 driver doesn't
> rely on global clock names anymore.
> 

Your commit msg should say: since which commit.

Best regards,
Krzysztof


