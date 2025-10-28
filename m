Return-Path: <linux-watchdog+bounces-4432-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B669C15ED9
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 17:48:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A1B13A7EB2
	for <lists+linux-watchdog@lfdr.de>; Tue, 28 Oct 2025 16:39:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC35533DEFF;
	Tue, 28 Oct 2025 16:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nz8aoOeh"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2874A23
	for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 16:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761669571; cv=none; b=M5FiD6ngtjfA7yhxz6wovysG4a81E7dX9YO/0q+JCfO0OFput8GySZJjg/3lxSLrx6TcVo4ikSfNlvkJXuqfsOvXaBtYUWBbh+o10kFOThRndEwazNeYRt5VPpju2R2Cz4n8kCYpSLVyjbtTFBsDFqUwv/Nf+CWwbHbXyc0tiWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761669571; c=relaxed/simple;
	bh=zP3J+VlPKdlQAc6OTTlYTFU+7GDzj56ylrqlwuxso08=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Pop32Aly80Kh2d3ln08QFDpYNXdGM8xDszd1BX0tDS1xTLvD0Y4JiGfjjirgT/EB8TD0VAOgxaNhEcyMDCF11UV2FGpkFlwnY6afcgzzo27Y/b6RZALHfvyjjtC542oFomde/nNpFq4V7Hu7//WXCPa8ZylK7SRM7xYY6DlAWQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Nz8aoOeh; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4770c34ca8eso25048635e9.0
        for <linux-watchdog@vger.kernel.org>; Tue, 28 Oct 2025 09:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761669568; x=1762274368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcHMVAPYUuPtMvzqAzqerLaFJ6QQ9Oj/SGmTjMunbDs=;
        b=Nz8aoOehqKmKNPPSYfWCoHLduQXZiv2c3p7QEgMY+whVn3wbGBHt+fuLdOYbhxaVHN
         V8VkY0cXuU9oEsVCtUGDXi6rXfZlHSEMEzrScaUayZbr9RzxSu4LZrf4qw1flnEieZ72
         E2LkjQFEcVT7zIXF3SSFsDKf1xt8IUahFDrFKqUp5VB6tZ8SKB4e5jFzd6T0Qx13dMqY
         irIIENtZr1j92bKulmUXVVGG/enCgn7l9aHbWTOMiVzmt2Z6FYLLVaWUxIgtb1XA/1B9
         uqbszI3ABL7Yzqzj6zpVi1N0iiMDlOgD0SAPcSbtMgcn6ZWxI98syl1DAKmbbH0latzL
         xUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761669568; x=1762274368;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lcHMVAPYUuPtMvzqAzqerLaFJ6QQ9Oj/SGmTjMunbDs=;
        b=naOnT0yRZV1L3PNoZf/5+23VyYCqOVJehtXOqG6SwbOPD/3fVVags17HdisAl3Z4+Z
         vW47RXJuESSgw8k3Wvb+HLNTax5fvnjkWFcEcDz3eRIKk7dw+mG2fyUDBBixX4FdlNkm
         GYoBhrevM8SOq/hiDyYC0DwfSlWRrZmyPJr4BsWZfWQ56eF01GxS4N7fYXkHasT3PVZ0
         agH0m1Sur8gti63d3sutMBoObGSsZ0rgtDdKGjS5TgdQN2MKF4/biwNtFZBgLa3tC447
         r695QarKD9rbWi7++m6YZv4LmwiCta0jo5/qOPOLIZX761iqcgIoKZLzwYrAkttY2id4
         hHqA==
X-Forwarded-Encrypted: i=1; AJvYcCXdYRcTa+gwGE5nS1+89a9gpqmJrp2Ska/cSrir6VLL0M6UHwnPXZ7kzBTNF+TAQidOUck7PvJD161NSipEGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSEyBFTalSANCATkE9rahd8ETpLiR/O7UKFX5JtwzG66E/q4kJ
	ndNzCqBrDwBZBuUCfr8Gl2nPuton9l1UlAv3F5VyFTp/msiaTwqP95eC970gZnFD5d92FVQYcQ2
	J6RLhq08=
X-Gm-Gg: ASbGnctC18aIGRd9zwgkwOV3Aiv4PZwV6lhk1bB6nxwmu3id012YehQcYGsb86EOS59
	cyLqvlJDdFyioiSNd4JMlly+XIH6/FEAJrbgUZIgqsXLimd4NmoTBkJjIaR6sDcR4MocuE0BT90
	zvHxRU3s9jM23grxqKGLRkyp7N5Ec9mqfnvnng6fYpJPJRkyK9rpClfJKgpGzC7p9Jkw9+/fkA2
	RmNKRqMbN+ODwXNFUxqt5xDzWbXP+3jsxK8/9M50b3BmL6vyBxFHVKPkUIvpyiefJh2fPy8WrDY
	1UhHfJtod8rSEXq5LP6uLIOGHFP6k+kPmunMnqviGgQI4TuBRjedfwr6i5Vywi797WaR/qyXRN9
	/DXEl4QcSRq8+M1jBNrCqAu60BPF70NhkeYyGa+RG02nhmGEqHMnbJYR+zWK/oAqfEQ/4mIPAFl
	MXKv5RiTKEIz+tOJXXrtixM31Ew9fVI+yNv3QSd8xpvSZyfGBV8w==
X-Google-Smtp-Source: AGHT+IHDQUmc9NUz1YBsyWTbssHjvqzzeagqY+Gkt8YsP5cvJatw0v3cmWF0cKEjtoPX1E4mJkVUdw==
X-Received: by 2002:a05:600c:4ed4:b0:475:dde5:d91b with SMTP id 5b1f17b1804b1-4771e3608f9mr360295e9.17.1761669567841;
        Tue, 28 Oct 2025 09:39:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:ebe6:df10:d28d:aa5? ([2a01:e0a:cad:2140:ebe6:df10:d28d:aa5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e202093sm1101915e9.11.2025.10.28.09.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 09:39:27 -0700 (PDT)
Message-ID: <ad48a3d4-d0df-4581-9377-639af87f0960@linaro.org>
Date: Tue, 28 Oct 2025 17:39:26 +0100
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3] watchdog: Add driver for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251028-gunyah_watchdog-v3-1-e6d1ea438b1d@oss.qualcomm.com>
 <25f7ff09-08ea-4969-9184-9fd01b097558@kernel.org>
 <76479593-c47b-41a7-8349-5d7c1403f7c0@oss.qualcomm.com>
 <73955d58-544c-4299-a099-bfd9e5912a40@kernel.org>
 <636a1f99-acd4-4904-8fae-f159646cc1a0@kernel.org>
 <f4d80be9-986f-4d37-9c25-725eff7bb653@quicinc.com>
 <e03373d9-e2dd-48b6-93a6-554fcd623718@kernel.org>
 <59a00934-cb42-43de-ac5b-a9292b08301d@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <59a00934-cb42-43de-ac5b-a9292b08301d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/28/25 17:33, Pavan Kondeti wrote:
> On Tue, Oct 28, 2025 at 05:17:44PM +0100, Krzysztof Kozlowski wrote:
>> On 28/10/2025 13:27, Pavan Kondeti wrote:
>>> On Tue, Oct 28, 2025 at 12:07:40PM +0100, Krzysztof Kozlowski wrote:
>>>> On 28/10/2025 12:04, Krzysztof Kozlowski wrote:
>>>>> On 28/10/2025 11:58, Hrishabh Rajput wrote:
>>>>>>
>>>>>> On 10/28/2025 3:10 PM, Krzysztof Kozlowski wrote:
>>>>>>> On 28/10/2025 10:35, Hrishabh Rajput via B4 Relay wrote:
>>>>>>>> +
>>>>>>>> +static int __init gunyah_wdt_init(void)
>>>>>>>> +{
>>>>>>>> +	struct arm_smccc_res res;
>>>>>>>> +	struct device_node *np;
>>>>>>>> +	int ret;
>>>>>>>> +
>>>>>>>> +	/* Check if we're running on a Qualcomm device */
>>>>>>>> +	np = of_find_compatible_node(NULL, NULL, "qcom,smem");
>>>>>>> I don't think you implemented my feedback. This again is executed on
>>>>>>> every platform, e.g. on Samsung, pointlessly.
>>>>>>>
>>>>>>> Implement previous feedback.
>>>>>>
>>>>>> Do you want us to add platform device from another driver which is
>>>>>> probed only on Qualcomm devices (like socinfo from previous discussion)
>>>>>> and get rid of the module init function entirely? As keeping anything in
>>>>>> the module init will get it executed on all platforms.
>>>>>
>>>>> Instead of asking the same can you read previous discussion? What is
>>>>> unclear here:
>>>>> https://lore.kernel.org/all/3b901f9d-dbfa-4f93-a8d2-3e89bd9783c9@kernel.org/
>>>>> ?
>>>>>
>>>>>>
>>>>>>
>>>>>> With this patch version, we have tried to reduce the code execution on
>>>>>> non-Qualcomm devices (also tried the alternative as mentioned in the
>>>>>> cover letter). Adding platform device from another driver as described
>>>>>> above would eliminate it entirely, please let us know if you want us to
>>>>>> do that.
>>>>>
>>>>> Why do I need to repeat the same as last time?
>>>>
>>>>
>>>> Now I see that you completely ignored previous discussion and sent THE
>>>> SAME approach.
>>>
>>> Our intention is not to waste reviewers time at all. It is just a
>>> misunderstanding on what your comment is about. Let me elaborate further
>>> not to defend our approach here but to get a clarity so that we don't
>>> end up in the same situation when v4 is posted.
>>>
>>> https://lore.kernel.org/all/b94d8ca3-af58-4a78-9a5a-12e3db0bf75f@kernel.org/
>>>
>>> You mentioned here
>>>
>>> ```
>>> To me socinfo feels even better. That way only, really only qcom devices
>>> will execute this SMC.
>>> ```
>>>
>>> We interpreted this comment as `avoid executing this SMC on non qcom
>>> devices`. That is exactly what we have done in the current patch. since
>>
>>
>> So where did you use socinfo? Point me to the code.
>>
> 
> Okay, lets go a bit deep into the socinfo part. we have used
> `soc_device_match()` API to detect if the device is qcom (`family =
> Snapdragon`). It works. However, when we built both `socinfo` and
> `gunyah-wdt` as modules, we do see that `gunyah-wdt` gets probed before
> `socinfo` because the driver that registers socinfo as platform device
> which is `smem` probe is getting delayed. As you may know `smem` device
> gets registered by `OF` core directly before the whole platform devices
> are populated. To make sure that any configuration works, we went with
> `qcom,smem` based detection. This is mentioned in the cover letter, sure
> it is a detail that can easily be lost. Now one might just say go and
> fix probe deferral problems. The problem here is that `smem` platform
> device creation happens differently to other devices which is leading to
> probe deferral. I can enumerate the problem in much detail, if that
> interests you.
> 
> Please help us understand what is the real concern here? we don't want
> to call `of_find_compatible_node()` API on non qcom devices but it is
> okay to register drivers. It is still not clear why would non qcom
> devices/platform which care about performance load all modules that gets
> compiled with ARM64. Needless to say it would load lots of modules and
> register many drivers which never gets probed.

The module file will contain the devicetree compatible they match on,
and they will only be loaded if they match a compatible on the loaded DT.
Some modules which doesn't match on a compatible, PCI id, .... like yours
would be loaded on __all__ arm64 platforms.

Just have a look at modinfo and the whole Linux module handling.

Neil

> 
> We are in this situation because the gunyah overlay does not apply on
> upstream device tree [1] , hence we are creating the dynamic platform
> device.
> 
> We are adding this device to support watchdog (thus collecting ramdumps
> and supporting restart) on devices where Gunyah does not support any
> other type of watchdog.
> 
> [1]
> https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/


