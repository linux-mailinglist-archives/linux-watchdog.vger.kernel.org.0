Return-Path: <linux-watchdog+bounces-1468-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9080A94C5EE
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Aug 2024 22:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEBD5B2122B
	for <lists+linux-watchdog@lfdr.de>; Thu,  8 Aug 2024 20:49:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F6651442E8;
	Thu,  8 Aug 2024 20:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQFRtLkC"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829318827;
	Thu,  8 Aug 2024 20:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723150154; cv=none; b=bTYA9T3uQlMIbl/z80Wrj5IAdmXe9GsVYv4samIWojf+SJ5hYwxkEh2QHpW3B/wVTv20SPPP4X22IruA9ou/Oz2mTtlXJcx77cNegjREWdiyD7ScyE+pSwY+wdxIdKocw5hkNHhS71T98xrnuf4sWt2OtZ3VFLlXDJiSORKIFas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723150154; c=relaxed/simple;
	bh=G6C/2q8CWsnkA3j5YjLGRlJUp+4sMXIA/FsCPxeWjHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CPjYmPPS2uvj+vRgS20XD+GwjAtfjuEv/XjZMV+RqJh+2w7azkEvKpvj8lOaXzynZknh9lriMst2tOTz4cNYD702F9RFTHBdqUdLg/ggBnt7F0XS1sHPtog17zxurLOTaBOot/kt2DXgwrb6zYxFOy3/0Py3ELgcaZTRTXYcbmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQFRtLkC; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fec34f94abso13746485ad.2;
        Thu, 08 Aug 2024 13:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723150152; x=1723754952; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=sOMDPIeCc+zLFkzUCpyj2Gt2XUIxX7hIehtjUvY5qN4=;
        b=WQFRtLkCWVRO4QemhorlRjYSsLzkXfXaY21JgGO2szpjnnvMM1IaVXGK4ncIuvjbz1
         uo7X2u/wgp4xrJoaYrrTh/a4skET5etC/baYMyDk5u/lr/tCUXEFBmvq11rB8uk6lbVA
         RPJNpB+qsHte9yCM8hIyZASoPJ3PgubduhFndyAN8X/uPK0oNPAtnKyW68UKbUjlLUCU
         U1MPc7arnNvt3+KalOMNhjQBZcMsbckuBQMTS69QqGaY7ibmscjQX0QGC5ltNSdXsTK3
         MRNeba5QDuIGifZCVgJFy7rThcRLlsQgPcFLVfZXMCjvsuKFXniqDZZMyAr8tYpqRHnG
         8miw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723150152; x=1723754952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOMDPIeCc+zLFkzUCpyj2Gt2XUIxX7hIehtjUvY5qN4=;
        b=VRup+R8d+GjAHWybQQtAI7f6hnE68LnQBaSWWvEuqRMBJd47w448uN0EkLkny5W4Kk
         D+7WwmOg22/xvjfk+dGtUeUD3+A8kbGXqODtlrqNCpEIeIKevkDJnYKoAv1dAm6VD1BU
         yxVN/UtcinKxH7epuR++0D92KM1p8t+CsZ5VFslPMRq62zOWUzkycA2Vch2ksIf24sku
         7lhgcQL7k2OD4IcFrW722O54kU7kY9/5GyN5XfAAN5a5ke4DQclyKdHbskHE0AGWIDOr
         67/TshPofkH97Z2FRSy5uw14dqN29N2A/dhlnvuHe0W09qKdhoBemOu1w8Sl9QmQFp2b
         8NKw==
X-Forwarded-Encrypted: i=1; AJvYcCUBbIi3d5ACxAItwJ3Dlc2/RVVG8O4Tfd6oy1XWvFArx0ZfrI+y56nUuePu4e2mLMfIG1T0xkdWS1TZTeNEQoM=@vger.kernel.org, AJvYcCUFBacg0tBkqsC79vDCI2wNIJFOjJyLyxzLKAYL/NY8Z9EiU1Hq7RkEER8xqMNYP6kmrZYxWao3K5F6A8aK@vger.kernel.org, AJvYcCXxVAesczmQ9IdQHVIV6QsP52ZagmHn+LTQsjvHuztCEYC9jhaOZWiu9Ur1XSEeHmYCOVBEdeuIVzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKL3l8Lrac0tkqUgX2YUlQqNUEGOMv9ukkCwzgDPNKIbnugb0P
	lHXJBF4ANJPjgx7hRFdgSh6eVvdtt/cg1x0m/gsvBARI6B1QVjVHwpDBPg==
X-Google-Smtp-Source: AGHT+IEbKUiENmIxquqpdyXTNyUXlfvxD3yYoD8wIjln5qOQnc9ynveYbwPU5tNSzi9A1RNvRK0+xQ==
X-Received: by 2002:a17:902:e746:b0:1ff:4fa9:1435 with SMTP id d9443c01a7336-2009526df12mr33951295ad.31.1723150151653;
        Thu, 08 Aug 2024 13:49:11 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59058d03sm129434025ad.179.2024.08.08.13.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 13:49:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <474dde6f-5c31-4bf5-a13f-d10b8460c4cb@roeck-us.net>
Date: Thu, 8 Aug 2024 13:49:08 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Documentation: Capitalize Fahrenheit in
 watchdog-api.rst
To: David Hunter <david.hunter.linux@gmail.com>
Cc: corbet@lwn.net, javier.carrasco.cruz@gmail.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, skhan@linuxfoundation.org,
 wim@linux-watchdog.org
References: <20240723131849.264939-1-david.hunter.linux@gmail.com>
 <20240807185332.61624-1-david.hunter.linux@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240807185332.61624-1-david.hunter.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/7/24 11:53, David Hunter wrote:
> Capitalize "fahrenheit," a spelling mistake.
> 
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> V2 -> V3:
>   - Fixed misspelling of "Capitalize" in commit message.
>   - Put Tags and Kernel Subsystem in subject
>   - Put changelog after commit message
> 
> V1 -> V2:
>   - Fixed imperative mood
>   - Fixed misspelling of "Fahrenheit" in Subject
> 
> V2: https://lore.kernel.org/lkml/7b7ca7e0-6bd2-45ab-bd9b-40331a8e6fdd@roeck-us.net/
> 
> V1: https://lore.kernel.org/lkml/20240723131849.264939-1-david.hunter.linux@gmail.com/
> 
>   Documentation/watchdog/watchdog-api.rst | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> ---
> diff --git a/Documentation/watchdog/watchdog-api.rst b/Documentation/watchdog/watchdog-api.rst
> index 800dcd7586f2..78e228c272cf 100644
> --- a/Documentation/watchdog/watchdog-api.rst
> +++ b/Documentation/watchdog/watchdog-api.rst
> @@ -249,7 +249,7 @@ Note that not all devices support these two calls, and some only
>   support the GETBOOTSTATUS call.
>   
>   Some drivers can measure the temperature using the GETTEMP ioctl.  The
> -returned value is the temperature in degrees fahrenheit::
> +returned value is the temperature in degrees Fahrenheit::
>   
>       int temperature;
>       ioctl(fd, WDIOC_GETTEMP, &temperature);


