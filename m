Return-Path: <linux-watchdog+bounces-2015-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF7E97E37A
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Sep 2024 22:49:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7B45280DDC
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Sep 2024 20:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8D56FE16;
	Sun, 22 Sep 2024 20:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0ua46cU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4F86F2E7;
	Sun, 22 Sep 2024 20:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727038186; cv=none; b=mM3T2d8hi2z1zt6nL2hBe4EeyovhdUtXcVjmAXC5UhBzxaTrAsbnXUso5JfRjWczqRMEftjJ9m2yvrnnysCJFYISL8s8ZxiY03NV1SunKTo65DZHDligsAelhmw8CF0XJo4WMCKzQkfx4+C83usU/15V7I2d9NlYU/+Wyb3it6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727038186; c=relaxed/simple;
	bh=oQT3eNJe+2e3pbbk016LlAOPZ6oa4T2prJ8oMWMZmSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H05cTbxsZoUF1lvZcQnXwCAs/WNRtxhn141qpmBU0pgUKirEnaahepddedRaU9OyhLu82mSBtTYm+dlxCn/HB8+ro+jdIpGtbI0jHdBkpye5er+VfCHhJ4k4zFHJSnqLcXa0Ux+37KErO9a/iPBzQksmF4sK7VAp9oLqNrbYF0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0ua46cU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2054feabfc3so32550685ad.1;
        Sun, 22 Sep 2024 13:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727038184; x=1727642984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JjGMGfedFTVMB3YLy+hzF2JSal1CaPIr9p9ibjLNREE=;
        b=b0ua46cUgyG6lZZ0YQ+0CFSFpJ8yL+FIh0lsuUACIAYuz75Ge9mgeIIkcBvZHNhHdf
         nMT+qiBrfvPyv2yBHYgfIQ8OansSIcb4Yypa9MeVSltxe6NiIkAVJgvsjQwpLcB4lp6R
         /4PN4a66kGVdGDUyHauRpIN/xhhWviVhEtD/PxrqnBiQpu19m8IjfKcz+NnwXs0p0ycP
         sE9V9D3GmkA2q416vUEqsbMWaX6KXmYcJTNjQ4et6balbiOhMgWlbL1zfpW+8Wwqfy33
         8Kr/qtYNTXYMuEYod2tFJI0/ZaJYZAyyIxdD2SnZxl7hhf7g/lm6U2VT8KNVRyxfgdjr
         KnPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727038184; x=1727642984;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjGMGfedFTVMB3YLy+hzF2JSal1CaPIr9p9ibjLNREE=;
        b=ZCUGUtnzSSt9mnlTmrLfeEgbPfh/MJY8nY17tb9AM+7t0i9o5RAy67mk5ZgxRCdFa0
         ml+XyF8u88N47OFUrT0Zcx1JqdV5BWe0pYf8AW+t7j4XSqp21dlFFXa4/jxcBlAddHiz
         YTK4CSOsEOC5enUc5PCzBklwa/XAnD5XhcvXdHfJUUDTBvehs4jHfLul55PfTZ2cHH73
         gH/Re7EA15XTx4sb2ICvEjo/Fvp4T43C8SxPjKAr1gzk/60c+NDhRZ7pg9NAnbEAuUIS
         FrAqo3Xjj0IL8U0PZv8uus1UJRaFxO+GLDsoFjr/QlLTAayuyY/JDzbfydh25Yp5RJFX
         cxxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZSQkm/ogp/2Bqkwi1SRM3iua2H7xh8aoRJDdIMMgED5rOnI7D0QOfArmXqjq3pHwnafUduh4INQteiw==@vger.kernel.org, AJvYcCV/FWLX2j3M97H8q16Zbl4Dy2beviC20CpnfJlVHHZ85egNh3uve5y5BNbGyHEJfJ7DgC1TqJyiItd5@vger.kernel.org, AJvYcCXBWRyFXfBz0/tgblYguXjs1IwruvxauwRUHgFcUanKChWRcYmPhhrfbNQDyelu4HTL/7SqxOwgLtN5ex7G@vger.kernel.org, AJvYcCXwBVf8zEwuKRSlX+r3M2SmiKP8q/H36S3t+2N+XPrcjLJehbeIr9Zsn/95/v/lrkmG03Tzkkzh71oXRjneQ4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7w6mWTkB91gQcvJhaQXZkMRrYrytg3VoUGO66pw6nxTsYFG2K
	BYFgV3gJWM1zU2oAkCBFCNKuyI+hmINTucdsGE3Zfm8/QLjt+QBSsMhi+Q==
X-Google-Smtp-Source: AGHT+IGxUKToLdho9J9KYVKuS62u1RAmIwEmj4ZixkolpXYqkF1E8Q8L4I2f+KdNqq48g+/jHdSh2Q==
X-Received: by 2002:a17:903:11d2:b0:206:d8c2:4a94 with SMTP id d9443c01a7336-208d982fb1dmr146417555ad.25.1727038183892;
        Sun, 22 Sep 2024 13:49:43 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d7922sm122785505ad.181.2024.09.22.13.49.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Sep 2024 13:49:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <6dc08062-9180-419e-aea1-241e636c7321@roeck-us.net>
Date: Sun, 22 Sep 2024 13:49:40 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11
 compatibles
To: Nick Chan <towinchenmi@gmail.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Cc: konradybcio@kernel.org, ivo.ivanov.ivanov1@gmail.com
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-3-towinchenmi@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240919161443.10340-3-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/19/24 09:05, Nick Chan wrote:
> The blocks on A7-A11 SoCs are compatible with the existing driver so
> add their per-SoC compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>


