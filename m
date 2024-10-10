Return-Path: <linux-watchdog+bounces-2171-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6219998944
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 16:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 52FE31F28B63
	for <lists+linux-watchdog@lfdr.de>; Thu, 10 Oct 2024 14:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F4B1CC172;
	Thu, 10 Oct 2024 14:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dAHclbv6"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD561CCB5C;
	Thu, 10 Oct 2024 14:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728569692; cv=none; b=p2lFYpQ1NEMDI0IDHb+Xjk6LYMS9Bd68twQLSSYgZcxyBkhT52+7AGPPvclrTP0Q8tGV1GwsgN726gWN+hAjC85ilgzJBZy1lsnjwx+RVj2PXX6O6ACZYIuPQBRPCn5wBCs0oS640NFC2m/8u0Qt2rbA3a8kWohiIc2FGnU9hD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728569692; c=relaxed/simple;
	bh=5if37T2Len4PHlz96BAcZRBUNl6DKqeX+sAZVkKENPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpNM+kCPkuti1kdesoIMboWS6aXeXyihfZMwrwL5Hb8j+COy4RKB9EzxH1J2Ll4ykDsTE/zwXeySU75pdVdBgLfFUMy1eMJHFoYOeFN58a1J0VjtTMtUaMWPHaCbvLzNRRQEOc/kWxSC+OI5yTJEcw2h6WmUOjOX513BY9ypUVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dAHclbv6; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-71e02249621so796345b3a.1;
        Thu, 10 Oct 2024 07:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728569690; x=1729174490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qoflmzKG0xjefCinuhjdDm1wHD1fpDIHjHWWay70BDU=;
        b=dAHclbv6bt4P8A4yxl8gFULrdLNxHvuDPKIx2SWulN7l518VJMayk5xhn8vLtAhezC
         RueO7FIIXtjvbGxIfqGy4tvjs+68GN4ZDFlivBiq3ftItcD1HPGkmoxD/yqYU41+N2K5
         AxzhccDroJO5SpjnVeN0+f4tqmCilTJVsfhwZPeuPiVjDIu1/fQfq9gXQfCAoO9Xp+2C
         TlYiW9S3RiWNlEjxL9tQ/48ffPCOQkZexDXQfnQNTltwYTq+7M7fMXE19l/D7m2LFdXq
         gtcZ6gPTjUuVpzCb3UdgLNCmuW4ug2y9bOPmox0SdhmAfKDwZOWLG5DhgFefvvlN82qV
         Lq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728569690; x=1729174490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoflmzKG0xjefCinuhjdDm1wHD1fpDIHjHWWay70BDU=;
        b=Xk6rC81UHSpLLI2cI5enK1K0bC8oQ2UDJkWgPeM7FaVYbUv8SG/KW/eF65Iq40ssn0
         4UQK1VPWWOU+epYdex+0hersG3q+C/VbV7AR3CxkL8NtNTvYGnGKxA+0NTII8V61CpZw
         xStvYQb6KS46pFo5rzHG6kD39e1wWAYte+LmIz9GTpiKnlb8p9ldfb16FaKk5nJlQGQD
         u3Gl22u/gi39XmjyBYYnxJAtUddaJOKx0DJsho/wMscL23h4E62N2RAw0H6NWb2Ilign
         nVrLICs0mjFvemzwp+iksgLXk31UHd6+PENEgI02I3Oj9P8HwpC4miJWcb5lLw3ALNpt
         zWrw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5nUFuzGDrTacbgNu2b6CnCUTtgLaNqe3Wb+1sH+oYXOI5WJFaxEgk2pyCjSpQ+CnpA77DCtyfWaW0o7g@vger.kernel.org, AJvYcCWrLgXnGI4HrYhke1d4qOktE7pVdPrGr8FCxC1KXn6GKxy8aIcZah5Ofks4+11HIWgyu0tUc7co3IE1@vger.kernel.org
X-Gm-Message-State: AOJu0YzpCv6FDByqQuAGCubfNAnaLVmPIXhrRYGFRbWjQu0vXgWfbdTh
	VDyprbGZODRtS43SwmCR+x9SNjeZaGxQCQj09f4UBUadpJAnrYN3
X-Google-Smtp-Source: AGHT+IEugzCbQzBl4ZRBH73suQXIncKPw8OXBX/sUT2w8P0P7I/SyLhmVdaOWU+7NnLDd98IP+nYTg==
X-Received: by 2002:a05:6a00:1749:b0:71e:148c:4611 with SMTP id d2e1a72fcca58-71e1db6488amr10122047b3a.6.1728569690374;
        Thu, 10 Oct 2024 07:14:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2a9f7813sm1065971b3a.45.2024.10.10.07.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Oct 2024 07:14:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <40083f48-5e8a-4483-9858-8907c6a4643b@roeck-us.net>
Date: Thu, 10 Oct 2024 07:14:48 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: watchdog: rockchip: Add
 rockchip,rv1126-wdt string
To: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>,
 wim@linux-watchdog.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20241010061408.1351865-1-karthikeyan@linumiz.com>
 <20241010061408.1351865-2-karthikeyan@linumiz.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241010061408.1351865-2-karthikeyan@linumiz.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/9/24 23:14, Karthikeyan Krishnasamy wrote:
> Add rockchip,rv1126-wdt compatible string.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Karthikeyan Krishnasamy <karthikeyan@linumiz.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> index b5a3dc377070..1efefd741c06 100644
> --- a/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> +++ b/Documentation/devicetree/bindings/watchdog/snps,dw-wdt.yaml
> @@ -32,6 +32,7 @@ properties:
>                 - rockchip,rk3576-wdt
>                 - rockchip,rk3588-wdt
>                 - rockchip,rv1108-wdt
> +              - rockchip,rv1126-wdt
>             - const: snps,dw-wdt
>   
>     reg:


