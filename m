Return-Path: <linux-watchdog+bounces-3307-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF97A8ABFD
	for <lists+linux-watchdog@lfdr.de>; Wed, 16 Apr 2025 01:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92B7A189F09D
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Apr 2025 23:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC2C23C397;
	Tue, 15 Apr 2025 23:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZwmrLAYM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AE71C54B2;
	Tue, 15 Apr 2025 23:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744759159; cv=none; b=Yphkon0vnjrgN6tQjtiBGsMnCidy5AGH5iY+oWp05lIJY1fxQ3DI+2BG9MO0mY+BbXcPjt2w6k51uqkzNbVmyNbQnZc7si5XOo9VOi9xic+4TwauRB7sxjQxOTEQSZ6R9auNhPlw/dcA+SLd0sFNBQ32nmSg9gJdPC8s9VN0F2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744759159; c=relaxed/simple;
	bh=D0lzXvZyHbFVtMo1SQrrYdaZBU12V8eTTa/+790spmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pz4TsYjG7LuyjFesqzA8EmEXCdAWs1QVDGl0YvhPu2q5ORXz74Xi7voJL18CJ7V5+5jvlvM60Tr/p0xnCGLb0hzGtnvS1vJsg+2F7CEF4VwYv/1+A+S3r4pRZxSXmJNeK7v2p93rgoqGjuGy62qk09Y5SqsJ1MAwTDMqY/58Xa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZwmrLAYM; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2254e0b4b79so83728505ad.2;
        Tue, 15 Apr 2025 16:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744759157; x=1745363957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6Uz8mwJwPHkVQCi8rBhtjOuyYKHaHwNNztNczM1D3jg=;
        b=ZwmrLAYM9aFfEyQwgeexKGmX0/cahnOjPs1DHRs0WRgFCaP7UCDO0Nt1pfEe+dTv/K
         XP2ArKCwYZHYIde8COFUJmVTX5bMbnE6mxWmgHRIqPX+fIHemZzgC9sFFbTN+ZwZqiV+
         Z67njzsPwHWZFNb/twPV9FXbGuIk4VmjFbZRcEL9KMT94Nbi84BryvS9twmxarjmfxhM
         Gs4FlNykYm4QgUtmp7D+6jdW3kQoUNGBNIVwlu9o9EPQjBJBhgAMeFJQIWhUyQHoCW2j
         dfkyrbU1X7Pn7Kb60iVbX8P85Qt+p4vvydV40UukiqrYGZg7OUkryEDCziA1MW9jVfR6
         P4cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744759157; x=1745363957;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Uz8mwJwPHkVQCi8rBhtjOuyYKHaHwNNztNczM1D3jg=;
        b=SNdQMDy/rjToXxUrK8xGgJOxVm3Mx5HJVd3IICBqxodGpJzNIyRGI4taIOe7xY4pvG
         kcwe1CDKqp4YFn2OMDwPPKjIyyXjRCvqFdPwi+yfExbxWc0COR8e+C+TycvlAtKKr/ji
         IZd/PY4ZuVsEieTq/fA5zDlq9r3lfrI+tvu4WZe9O9zXHeX2y1v3FgFeOl9xj605nmz0
         kEi5UmRS2dS4vhZzehk3y2Vnpu0oATuuoh6sKL/odcmcYPc8RY4Y0so6fnT5ct/kdD2H
         A4PlfkY3w9bAfFum0u1Tl90fxBUu9l4q8Z6Z6Y3QAUTt/Zxm2oZJYgR75p2pGDKD8Z6o
         w1iw==
X-Forwarded-Encrypted: i=1; AJvYcCV2zFFr6Hsl1cjXPit8BXAsjcTrpHV+LP7DfQHdSS2HmEy75AGFICcTEVREhS3jTuQ50i4+7OkgYCGu1cXb@vger.kernel.org, AJvYcCXo4TePHE5jK6skbZVZs7r8eibyXyBLzpoVxLMwqodyr05xuXK3X0WsCzHIk/SOChkqKH7BzVN6/VaTO6Vh5e0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt5N3r18WBA3TBG1z2UWA+b/ihLd/VNw0eIY0szIBAnIAcwJtI
	6rMenmsmcL/psxiMeRHgkQNDWtyJX5hDHQiR/P+5C6CVv6mzqudHeGkvWg==
X-Gm-Gg: ASbGncvqFjB0qOClb+Tvt41gHi8uk485/M/jLvvMNQUkb9GhZg5kr57UghtTENyO8Zf
	OF7uWSenhkPteRN4AiYAxDy1guqAOQMv4AnthoP5jQZKX0wiq8ML+kcqz81SrhWRF6jA2HTG9Cn
	yHTvVV72PIA3M5gWSyp13HQ8LI/eJ7zNjXI6PeT0O6jnxf2puEOIS4jRRNynCAxtalYf7+8lesy
	5LWof32TI0GWYis0yvyPAgLB/GUe/lzHCKyoO9B5jlOisSbdnBEdHvGX0ZgftT0YMsTtObslKUa
	DzNvZWT0dM4h7PqMeGm42tj0pZbT3gfIzJ/qDVo7/bJLxgnES9JmBoyxGDaaUmgUXeHPT6Ojlds
	X8dBmpi7bzh3obg==
X-Google-Smtp-Source: AGHT+IEr1w8AewnfUi96g0d7L+sNevQaDEpx6nObcKwlsPmbGhuDLtAIO75xPJV0O8UtDw/711mczQ==
X-Received: by 2002:a17:903:bd0:b0:224:192a:9154 with SMTP id d9443c01a7336-22c319f6538mr10489305ad.26.1744759156939;
        Tue, 15 Apr 2025 16:19:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33f11a98sm968295ad.60.2025.04.15.16.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 16:19:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e0976e69-1643-4b0b-a7a8-0495fb4e5dc6@roeck-us.net>
Date: Tue, 15 Apr 2025 16:19:15 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: exar: Shorten identity name to fit correctly
To: Kees Cook <kees@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org, =?UTF-8?Q?David_M=C3=BCller?=
 <d.mueller@elsoft.ch>, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
References: <20250415225246.work.458-kees@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250415225246.work.458-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 15:52, Kees Cook wrote:
> The static initializer for struct watchdog_info::identity is too long
> and gets initialized without a trailing NUL byte. Since the length
> of "identity" is part of UAPI and tied to ioctls, just shorten
> the name of the device. Avoids the warning seen with GCC 15's
> -Wunterminated-string-initialization option:
> 
> drivers/watchdog/exar_wdt.c:224:27: warning: initializer-string for array of 'unsigned char' truncates NUL terminator but destination lacks 'nonstring' attribute (33 chars into 32 available) [-Wunterminated-string-initialization]
>    224 |         .identity       = "Exar/MaxLinear XR28V38x Watchdog",
>        |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: 81126222bd3a ("watchdog: Exar/MaxLinear XR28V38x driver")
> Signed-off-by: Kees Cook <kees@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> ---
>   drivers/watchdog/exar_wdt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/exar_wdt.c b/drivers/watchdog/exar_wdt.c
> index 7c61ff343271..c2e3bb08df89 100644
> --- a/drivers/watchdog/exar_wdt.c
> +++ b/drivers/watchdog/exar_wdt.c
> @@ -221,7 +221,7 @@ static const struct watchdog_info exar_wdt_info = {
>   	.options	= WDIOF_KEEPALIVEPING |
>   			  WDIOF_SETTIMEOUT |
>   			  WDIOF_MAGICCLOSE,
> -	.identity	= "Exar/MaxLinear XR28V38x Watchdog",
> +	.identity	= "Exar XR28V38x Watchdog",
>   };
>   
>   static const struct watchdog_ops exar_wdt_ops = {


