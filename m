Return-Path: <linux-watchdog+bounces-3574-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1644DAC1373
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 20:36:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7224B1899037
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 May 2025 18:37:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1390C130A54;
	Thu, 22 May 2025 18:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ynp51Emq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510E175BF
	for <linux-watchdog@vger.kernel.org>; Thu, 22 May 2025 18:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747939013; cv=none; b=DXdD+dscI5Fdj919HFn5Ne7wA3sa1heE/ZqaVB1ogsXFRvG853/At9kgKWmUtveY2/NKdJFT51SjjJYzKtEcuPxjn9HKKd7F7B3B2+P+NK4jWEInvrYPWv2t8+lY4sqO9f/GqjZeSPMOdlyTGA6xchEYdpcbcHBUpmQnhl8KllE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747939013; c=relaxed/simple;
	bh=r2LJRwJfk5HQfOY1MfeFn7U5D6uIM9YRcshMS9LAyXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=JN9U6N9PTfLXDDgzNX2RwsrA24DrN4Y4JXjPMNK+HIHe5aaYyQEErxE+afONNuRdqCkDgriBCUmRjbyqYPJIi7JUWzyZi5ojrbnMNnzw+2ARVuVwKgZbizelWtkPecYIoEf59KuQSgt3u5a28T3FxQUbudX97yv9lIla5R+FNSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ynp51Emq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a362e099cfso992594f8f.2
        for <linux-watchdog@vger.kernel.org>; Thu, 22 May 2025 11:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747939009; x=1748543809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RJGS5GdAP2jwMN2asFwop/bmwWDSIqO/lnl06Fno7WE=;
        b=ynp51Emq3Sz7WihnFRiS8jgSbdB9ZHFA6LAn0KXX6vjoX+Etc73olrQIWeEzIuD8IB
         gKaGwAEaW9psSOBtT96NyvNRRaQcJ+Bvs8rYh4kR+B21iqkK0DZXRznJc+kV89pirUgb
         D8tLRICQIs1FsgIlv3zAg89eXYRdX2fwt09up2jnorFJYRm8EOSk6CC3D4ZYYOYlwJuz
         17SH1C4OK4Oq4j8N1Q7wUjZHzyOQHYZ0xLNVlBPq0CddX+IgNuR4gNkJU6O0lWBNSWXr
         9jWN/5da0eNdPndLKy2Wg5xTnGnkcibBK8JYLQUs3rV+6cYF/VGZr1yRTju0uVjqtHgT
         SwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747939009; x=1748543809;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RJGS5GdAP2jwMN2asFwop/bmwWDSIqO/lnl06Fno7WE=;
        b=hGkUyLBe59wSZ9ubs8Bkxd5YID6+P+QKjjOvc50DrH7pQogLf8QcoYx0WbSy6509aP
         4cwIgD3C/LAd8cE6f3tM5yDBeVeNzn/4qS+FxpGKUOKVabg/8OD6PhtuvqHM7oPS+yIR
         PxfmXwfADfpAqf7glFfQqoeK2XYwaPGiRCykPjzfuX0jFcGoXCDxfTWuKh6zSySzA4A/
         a4gWHEPwv3aUZ8kUYmQDiIA/LkkZn9/2ajS7j4lAad3UOtQU0YzFp4yw+2SIkpj1TnH5
         cDH5WSrY3kfeErURf5lsN8aPtDAQ4gc7p0/L6SywPqBsVY4OJUPMC10wKAPyburoeFZI
         e/cg==
X-Forwarded-Encrypted: i=1; AJvYcCWxIuI1Wm+SSmmb9yE/dQij4pbHa5qo68UirzxC4XIcaG80uneUA+OWON2pbCs5rV+KNkVTHF/X9JwO/JIu8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjAhYT97+Ak+NCNStN1VqmUmgtF9peOT3k1VHl0zPZbtnfgF/7
	soIeEztB1Kg7CD9Shz6lKgrx9oFXvwsLdHPjAMSSn/DSD74vhiyA/WUp/QLpd2fqWP0=
X-Gm-Gg: ASbGncvMZGWbBKWaP41TndzhEv5DLKWSWq9tbe8dHxnmv7cJEcrgnVnMLN4qT/oV3py
	Trbl5H/jFk9xOg5FGDXyYLYaRcZtGU6Iwp3IFlHlBLP4EwBmHocv6inH5+T0ImxgZezv0McQlMo
	7NaIC5Nweihgs2NX6rwZ62rzkJUIH4wa23acJf8kwoUIhL6eMy/9v4J+cu0z8F0uGfNn6HVAGGv
	AzhYa+ey8b+UF+NS4iEhbtsRmxXXshOx5JOCS2W2OwXU6iJdbV5luYcfXwjPVQhhuHJFJEByTHj
	2j1bvlnzbaqvzoCI9Lo0+FKuaOHv3rI0GIBIx/9tF9kEXsGc7c8bKMsUQ0IjavHZHvdLNQA=
X-Google-Smtp-Source: AGHT+IHR+WLXCmN0YpGsXVAMyTrf5qwUXOqpxWzDyNHvcgpM8sHVsTuYa3Mt6GIgso9ohbfhoLilLw==
X-Received: by 2002:a5d:5f47:0:b0:3a3:6a3d:163a with SMTP id ffacd0b85a97d-3a36a3d18b3mr7521239f8f.12.1747939009584;
        Thu, 22 May 2025 11:36:49 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6b295fdsm120822505e9.5.2025.05.22.11.36.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:36:48 -0700 (PDT)
Message-ID: <3cf3f029-f56c-4ea7-a10d-ece09fdbb2b0@linaro.org>
Date: Thu, 22 May 2025 20:36:47 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] watchdog: stm32: Fix wakeup source leaks on device
 unbind
To: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250406203531.61322-1-krzysztof.kozlowski@linaro.org>
 <f1dc5228-ac91-47c3-a854-b425cb77bb5f@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <f1dc5228-ac91-47c3-a854-b425cb77bb5f@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/04/2025 23:17, Guenter Roeck wrote:
> On 4/6/25 13:35, Krzysztof Kozlowski wrote:
>> Device can be unbound or probe can fail, so driver must also release
>> memory for the wakeup source.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 


This was almost two months ago, got review but still did not reach
linux-next. What is needed for this patchset?

Best regards,
Krzysztof

