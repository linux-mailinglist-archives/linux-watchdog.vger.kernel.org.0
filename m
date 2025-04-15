Return-Path: <linux-watchdog+bounces-3302-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02295A89374
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Apr 2025 07:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0000B17676A
	for <lists+linux-watchdog@lfdr.de>; Tue, 15 Apr 2025 05:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F8A923D293;
	Tue, 15 Apr 2025 05:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y0xH+fao"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D5117E4;
	Tue, 15 Apr 2025 05:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744695468; cv=none; b=cUGVXIa23+cmqT9je83eNIitxIyse6BxHw1tH4SRYRZyWC3r4T/ubCkT+IB6T+srUcrvWWO0d8vQDCDmtR8YyYSYo8cEStcGNrFNO1E9po56/UU71hWDjK/6bljc2PvQuoIQEyKZ5Z9ts+lRMlFHqYHTMfMmKfwmPLttD36ycFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744695468; c=relaxed/simple;
	bh=OT/ow3Rit2Pzbgm9XllYJ2znWiqfnw6Tcq4OVwMhSxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CgYG3hiQa6u2qKcrJlN5pwEu8+hKJoQvqVlGKyXcTlGkenDIKLZlLeNz7otr5yff7PMmfQgQ3HvZgOiZ8V2su4xZM7kJKAriV6mfJrpqCYUv6Xy5ElkzE+uC9Was8mp73TRKmXDXttxV3YV74TNg8lXpJfSSw0eZGoESNcc9pxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y0xH+fao; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7370a2d1981so4018692b3a.2;
        Mon, 14 Apr 2025 22:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744695465; x=1745300265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8flXeGMcN8DVz3lPVeuDpme2GWkR5Yqy7lgnki0syIw=;
        b=Y0xH+faoFLmtCdAa/8CvkALUhfhwDg9rPjf2Ro3coMJ77PqwUm6kJwC0onpHUt/sb7
         tbve7+LUOBLq/BBUqkkptMad9VxRsrEdv/b/W3na38qOdZ7pmH6+m0bH7yM+jHa0Mz0X
         byCXpZLK2e4J5Bb9k//fMNKdpmSaFcQ+dOv4BSPUU21LeOYsnaP0rZ2WM1ZcPjGj1glN
         1F2XYhRmnp3ySyXbtrMkTd+FINOQaUvtCl6/NKnBZ07DwFOaeLRA/wofZlgBkzl5LgeA
         tyWhffSaT/FDsqAy5Q1d6FYwDilT5Zb+HZ31SdX3lJ9uNWXBD85J3yQaqD/FO8OONyeZ
         knEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744695465; x=1745300265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8flXeGMcN8DVz3lPVeuDpme2GWkR5Yqy7lgnki0syIw=;
        b=TNGinE+FpzhgimVlWxiwqg5oOZYIstvlrzfLEyDgVY8mlG6UkG2+p4ktBzhWyJBYM7
         E1MPKiPsbg+pftdogkimmqffoGNRh35GttWOYuAvpVCbzsZ0vETQuEDh9Uv0/P8L49PX
         PMVUP7qRciC/Ir1/pqjSDXJSmff3fBi/KOWf0ouzFxMurcvCNmCc+8XN9HYBHYH4ADhy
         G+x4IinQNud58X81kslViOtWiM+lfan/M7sysItJ2DpudlXwF5geYQer0xEmUZDyhphd
         Ji9R20/mt8PjHz0nwkGOXNeh/pTGFMBUgbhOHd3IcfVkK/VMcl3ac/3i4ryJkuHxMsEE
         8D5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbcbQmAf9UAAjhv4xXh4CTYJ5XVfEsqt/gOj9RELY0DOvPdnQORbxkurTiwdh/8BAppg7t8RockuJ1u8+bF5o=@vger.kernel.org, AJvYcCWw0M8c0To4y1e6nKlr8DIMlUjhrdIbPwx6d4SjJsi+j28ao+SIqp0HVHeoqRi6wD3fiHTyuYCnD3ih@vger.kernel.org, AJvYcCX08etJojYqdgAlEhjfBWEVuAKXuMVgTMK3/QT24sy/6h2tPXfyCR3IIVdKo7LTQOaLzzpPH4ZekiyENGLC@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg2iO7Ww9Hym2IhlVS9txTPfpfAlWlIgO8G99hkA0MrT6sWvsb
	egoA29mFSmsYYMRmmco9IeIbqkyt3WG48klgUlTiHJ4znEILT1yx
X-Gm-Gg: ASbGncvrsPZdRXRh0pdGT9d93XnuL1FbX6k1bKCv2TsCEOGLn/FmQmsyMLuw7wMabK7
	0I28mp6jCFg20/hMannKEiCDfpu+0Z3T3RYOitTawvW7eXdAWRiYpmycOuVVW87HmTbaM0aOXBK
	jpdSRVkLkQU+dfMdUj3ykxmtuoYzCSYhQCxDHVeg0om8EE5XAu44AMwHMOEp6hvmXT8XqnuQRmJ
	Qb3ZIZ6ixzxK6IunSGMrAUOmohXKIG5cszf3vK9kOmwptTfqn0UTUI2K1YoxONp+UfnVWg2r7HQ
	IVr9ILWEZble+nDHv4p1TPmwF6OG+fKTqIAWHFk9y4hpdseuZJz2ty5GmqMBJboXrefq6bJ/CH4
	3LHQ/i99fy/XvZQDe68HoLq/t
X-Google-Smtp-Source: AGHT+IGij4jcp0JaBuCtT/GgQB93ABcvo0Rbgg4vLD44uasnLdON39Wb0zLiyoGB2w7OeD+4Alnwyg==
X-Received: by 2002:a05:6a20:4389:b0:1f5:5903:edd3 with SMTP id adf61e73a8af0-201797a3bccmr22389174637.11.1744695465415;
        Mon, 14 Apr 2025 22:37:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0a639a4ed3sm614426a12.55.2025.04.14.22.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 22:37:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <be917c00-5de0-41ac-917e-6a787b5bfd96@roeck-us.net>
Date: Mon, 14 Apr 2025 22:37:43 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: watchdog: Add rk3562 compatible
To: Kever Yang <kever.yang@rock-chips.com>, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Jamie Iles <jamie@jamieiles.com>, linux-watchdog@vger.kernel.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>
References: <20250415051855.59740-1-kever.yang@rock-chips.com>
 <20250415051855.59740-3-kever.yang@rock-chips.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250415051855.59740-3-kever.yang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/25 22:18, Kever Yang wrote:
> Add rockchip,rk3562-wdt for rk3562.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> Changes in v4:
> - Collect ack tag
> 
> Changes in v3:
> - Collect reveiw tag
> 
> Changes in v2: None
> 
>   Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index 1efefd741c06..ef088e0f6917 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -28,6 +28,7 @@ properties:
>                 - rockchip,rk3328-wdt
>                 - rockchip,rk3368-wdt
>                 - rockchip,rk3399-wdt
> +              - rockchip,rk3562-wdt
>                 - rockchip,rk3568-wdt
>                 - rockchip,rk3576-wdt
>                 - rockchip,rk3588-wdt


