Return-Path: <linux-watchdog+bounces-3203-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B6119A7BD10
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 14:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24B3F1887796
	for <lists+linux-watchdog@lfdr.de>; Fri,  4 Apr 2025 12:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F23AF1E5B74;
	Fri,  4 Apr 2025 12:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yAfx2nMM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1693D1E1DF7
	for <linux-watchdog@vger.kernel.org>; Fri,  4 Apr 2025 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743771470; cv=none; b=S6xIzKxcI+ZZaeVuVX9zu9EhCqfHH9TQr7zGBkS7YSGqUrHndNtFQdAPErKATFZn7NGc4pIA0PuEJMacvuV0bt3QKN7kzuKBekeGMPO+5bOWhoTF2LeBW1EWLGEL/Q+LQZN97kpcV0cnm4nZ7QnHBtUKS2zPTdcRiuDDCMXGrL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743771470; c=relaxed/simple;
	bh=8d80S9evksG67Dfqh6qMD9RM1vPLOK9S9RAuXVlxw3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Kj7YWxFrBrqOXb4Cszi+yx9zV53wyqUCC4bituBL4cv9yUi8cdDPok6Y8amAKZfjYJB8g549sr6/KSFPZpvBCQuO1zYeJ37oa8AVnbbaGykmR3fZnXwSirnGTwf64asdcFmy0yDZfsqDU77GI6yEBLIM/LJxqZ9fEPi1G3+cz20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yAfx2nMM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so1713385e9.2
        for <linux-watchdog@vger.kernel.org>; Fri, 04 Apr 2025 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743771467; x=1744376267; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AP9s0rZpAv3GmSnbWi7Q2FkIgLBgF7bZd+YrGo3Mnq8=;
        b=yAfx2nMMRJofEWeqHdKM5IQ8QHOQNjqBvtZtaUvKxQa53lP/N9BNMO+TT77IEb8mZB
         89btRc6uR+fgzq224aApy0ZAorsdXH/jZV6he1dIWY8SIJfs3mob3RX0iA6VmFCvmTgX
         rfPVKuLyqv+M+Ro1YkBi7D9OYkdT6HXoKXz2tFjde/mkv34jRYVD0+EjMDdcWGQlGeLj
         BKvsuf3wflTNT0mwXJSW1Fo5L6eZ8ARq+OFMXH9lfRRusBoV4sQOiOFtjSpuxL1n2yFp
         1TrAj4Ox2M8LGzOHItmH5nEbPqMkXZ6rszChAiczJqVZf0/OHly9u2vp9GjgcLuxvv4c
         eQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743771467; x=1744376267;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AP9s0rZpAv3GmSnbWi7Q2FkIgLBgF7bZd+YrGo3Mnq8=;
        b=ALSlFEPWwSbff7pWYOTdr3IG2AcCWdfMQpymEsbRE3SMsSurRKHt0HvrtLfcz7I374
         SNsOtxbmU+8VhUz2nGNKK9CnQWLjahtgGQ6oz/au71X1nIj7a3b7v9fftxd4zuW3ixWH
         TVvpDCYDjwV2rSgPCVQzXukASSnX9knom9Dz9ovYLvvtStHGz3a6qm5A5754PkI83DeL
         4rCd3lSynATiXH+6FGgUGn+Iq5TXM8m0SocIHxJGBTNlqU+VzjkPZy7CZHp5ky3Ll0ht
         uwOndE43ng3ljaGGEUO2tMoljO2RwoIJbVudKwznL0980UsumsWebqAtrNMPDvRAUi6w
         g+uw==
X-Forwarded-Encrypted: i=1; AJvYcCWwbzEdq4b85ZxabhZR+BFba4/2S2E/iUKjY8Pxb6prlc31ee8jFVyPUgwTpcZi5EJhLlLtjFvE+rgja5sPlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlvSWnQG1vuk+qipCotA7R56mx/3JERnOzJRwlTh4XHYV8Ld0s
	mUVOMqbMkX+zFHF4yShEVxOhZUrPgCx9ChFl97Hqy8lyYeyo0KBDV+qTZ7VxYF4=
X-Gm-Gg: ASbGncu/vMzH8WA120wJwRR115l2rhvAvjj7c6jWh1aMxL3tGR1ivmWIlAm5CjtmEQJ
	qIlFNz2m4QLskO5v6IiwNDw8N7Cd4pS1tG1SoAgGzXGM7aknOH/9VS9g43DUjVIupADtXHk3Syn
	NWTgkskogvj1bNq/yo6QK+KvP0beFkBog/Lyv/4xDBJ0HZlodpjJusZWoFJ81td+llTnDGmphe9
	fwrDOc/igxRCQTLMWoo2WxwNE/4o6D9CU/Mmn7VLfYt4FAwcAT10gRsJgzoiba0OrcSYBPRLaKT
	q4g2uEVEgfzMGS3ym9EqJzE9adjyww+wsorf4s/xXUf7DBtry3ZGkUNsUbjQuaa6
X-Google-Smtp-Source: AGHT+IEGvAJ8IDkmHjyNctnZpmcOgg3Hg98h2KB/LoYx9eflP5cjgD19BLtwKDgGETac5jcnMEP/PQ==
X-Received: by 2002:a05:600c:5107:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-43ecf85f893mr7864555e9.3.1743771467349;
        Fri, 04 Apr 2025 05:57:47 -0700 (PDT)
Received: from [192.168.1.106] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226b17sm4345840f8f.92.2025.04.04.05.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Apr 2025 05:57:46 -0700 (PDT)
Message-ID: <4f69f618-bb9f-4269-9467-40c0eb3bc1b9@linaro.org>
Date: Fri, 4 Apr 2025 14:57:45 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: Do not enable by default during compile testing
To: Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250404123941.362620-1-krzysztof.kozlowski@linaro.org>
 <8b6ede05-281a-4fb1-bcdc-457e6f2610ff@roeck-us.net>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <8b6ede05-281a-4fb1-bcdc-457e6f2610ff@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/04/2025 14:49, Guenter Roeck wrote:
> On 4/4/25 05:39, Krzysztof Kozlowski wrote:
>> Enabling the compile test should not cause automatic enabling of all
>> drivers.
>>
> 
> Sorry, I seem to be missing something.
> 
> Isn't that what COMPILE_TEST is all about, that it enables everything ?

No. Compile test *allows* to compile test, but it does not mean you want
immediately compile everything. allyesconfig is for everything. Maybe
you want to compile some subset of drivers.

BTW, I am aligning with the most frequent pattern (quickly judging), so
of course I also accept argument that we should revert that other
pattern and use "default y" everywhere.

Best regards,
Krzysztof

