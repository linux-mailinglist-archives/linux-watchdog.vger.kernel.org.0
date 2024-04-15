Return-Path: <linux-watchdog+bounces-964-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D138A70B5
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Apr 2024 18:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E13828669A
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Apr 2024 16:00:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571D7133426;
	Tue, 16 Apr 2024 15:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KR81scAe"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E360F131726
	for <linux-watchdog@vger.kernel.org>; Tue, 16 Apr 2024 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713282875; cv=none; b=FJtuuA16c4bLQOFe3i7hokL+kpgR5/B9im+7dr10O/uWvRLbnwC4zLgJ8lWOi5wfaVKBcFNqhZvOaBtY9CeE+nP+sX9YXi2prY4bnedv7Xm879vnP+YQu9z2ttR70tYaf4NzPYAzZzkK1dBs33CwkhnDsrB5mQk4xC3Aif8itGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713282875; c=relaxed/simple;
	bh=t5FBk+7lOdE4iEeJ5crFgSx0hNRQ3Jlo7Ou/09aTUME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VKPa47REX3plqseQ0DmA3utvNdpWIrEVSAg3PSqd87+Rl2/D6GJvxhTYItaDCkAb6US9H3u3JLGOfH7ilu8pgwcvP4ouo3oZENavNVqByRDyXsJG11OZrr7rwJP1SwSUQ5xjxDuaN9SzOQ3xEypypZ/4cAP541dBw+K2GBrXpXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KR81scAe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e3ca546d40so33011295ad.3
        for <linux-watchdog@vger.kernel.org>; Tue, 16 Apr 2024 08:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713282873; x=1713887673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dKzyANCG0e2+eCWUxsKN4jLmHlfmN6dK2UB54sEUXfk=;
        b=KR81scAeCEN1yslENcozdDxH+3+knLKFH0LdSCoi0cLzYE0aoAXCS0e/KwYIQkbdzk
         DicTJnjJOohny7z5qy4Chbbx3GP7br6Jsdqf69tF/XLEb4dOi1tlZioyHqyrIvQ9WdpP
         BBjOouTwyJg+zDTAih9CDN6Xein3QJYE8ZpSORidhMinzXcHgscrMmhZqsDRFstWY6Fz
         UMKzstZBrN5vynMevYPzmgTbKEQyrs7X7arph4lRFB1J1veH+lj9A81gP5FTgQa8wCxy
         l1aiUksD6tzNBYpP5R5bfxiB8qwDoxkuamTG1Sgqdd+8vp8dX3LGNZCIZvH5zGFLN42p
         S5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713282873; x=1713887673;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKzyANCG0e2+eCWUxsKN4jLmHlfmN6dK2UB54sEUXfk=;
        b=Ls5/XH0wOizSyzxQonrHxmPFutAMVEcZRQZ48kEcBl0Cj6a9pKlM/fDH0BFfYsv4Db
         /6wM04K3tNSRKSvWV98FJn3yPyLq/wSB8hsDMkWcfM52EHsyHX0/w4xoeZ5bbVdB48f8
         zjPPuTYNs5HPPqfT/2G2Er/XD/N/b/9M5Kif7B7cKp7ZCB1oEdEnGdlz991raGh8SP3o
         vC7f3m34huYf/rBJAY6w4reOHWzhqa5OpWX7fiQr6GXvJppN+OEY0ndkQPUEjuLSLbe4
         O5y50itH8F5smSuag+7vUI/JzbyhupFee0fTLHCCmlRMPJP1zqFoNBkrR827+x4mA4KI
         y0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIOhmZ4fWStrfvnDgWt54UZrDDifJyvhf3iJknlSCksxzuwyFNHTXPWMbhH/TgJ5NAca2jJ9o1RAlQhAc7jq/boeuKyGk/hfgC4wOKLoI=
X-Gm-Message-State: AOJu0YwdYng1MHh66ze4wN6EUTrQULP3kC5ynC8Kuh+EHS/RxKi9y5Gz
	r1hgU9cNLpMO7MaqVDK0wOff0Ca4z8Fp9S4FgMJQzk4MM0JKYA8dMUTUHZHLdJc=
X-Google-Smtp-Source: AGHT+IGwGZ8vFNsBIlcbEwkIeLYsa6VXiJ7uwXqzMCMHZYFTmNIJe81/7Q4GVPzHLd9UHMGUJ8nq5Q==
X-Received: by 2002:a17:902:e542:b0:1e0:f473:fd8b with SMTP id n2-20020a170902e54200b001e0f473fd8bmr15736917plf.9.1713282872606;
        Tue, 16 Apr 2024 08:54:32 -0700 (PDT)
Received: from [10.36.51.174] ([24.75.208.155])
        by smtp.gmail.com with ESMTPSA id n13-20020a170902e54d00b001dc01efaec2sm9939360plf.168.2024.04.16.08.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 08:54:32 -0700 (PDT)
Message-ID: <29e54d8e-6b6b-49c7-b8ba-823b58c05fae@linaro.org>
Date: Mon, 15 Apr 2024 17:25:49 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 2/6] dt-bindings: mfd: bd96801 PMIC core
To: Matti Vaittinen <mazziesaccount@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Fabio Aiuto <fabio.aiuto@engicam.com>
References: <cover.1712920132.git.mazziesaccount@gmail.com>
 <ea49494429528cf8e60fa984ae1f523ddacd850c.1712920132.git.mazziesaccount@gmail.com>
 <b5eeaf10-e011-452b-840a-176c4f62cac4@linaro.org>
 <d3e555c2-e740-4aff-aac7-661877166399@gmail.com>
 <63d3891f-98d3-450f-967b-c72b0516b66b@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <63d3891f-98d3-450f-967b-c72b0516b66b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/04/2024 08:24, Matti Vaittinen wrote:
> On 4/15/24 08:50, Matti Vaittinen wrote:
>> Morning Krzysztof,
>>
>> Thanks again for the review/help!
>>
>> On 4/14/24 00:33, Krzysztof Kozlowski wrote:
>>> On 12/04/2024 13:21, Matti Vaittinen wrote
>>>> +
>>>> +  rohm,hw-timeout-ms:
>>>> +    description:
>>>> +      Watchdog timeout value(s). First walue is timeout limit. 
>>>> Second value is
>>>> +      optional value for 'too early' watchdog ping if window timeout 
>>>> mode is
>>>> +      to be used.
>>>
>>> Standard property timeout-sec does not work for you? It should allow two
>>> items as well.
>>
>> I don't think so. We need sub-second units. Furthermore, the timeout-sec 
>> (if I understand it correctly) updates the "timeout policy", which tells 
>> the expected ping-interval. This can be different from the "HW 
>> heart-beat" which tells the HW's ping expectation. Hence the "hw-" prefix.
> 
> Oh, I just found out that this is an existing property. The ROHM 
> BD9576/BD9573 do aleady use this. It seems I've had some discussion 
> about it with Rob/Guenter when adding it. Frightening thing is that I 
> didin't remember the discussion or that the property existed at all... 
> Well, luckily we have lore :)
> 
> https://lore.kernel.org/all/c390476e4279d8b75de53271e9fb8948d8854528.camel@fi.rohmeurope.com/#r
> 
> (I don't see the final conclusion in this discussion, it has probably 
> been done on some later version of the series).
> 

Sure, it's fine then.

Best regards,
Krzysztof


