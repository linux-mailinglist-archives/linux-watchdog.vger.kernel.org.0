Return-Path: <linux-watchdog+bounces-4213-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F49B501CB
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Sep 2025 17:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15EFD4E46DE
	for <lists+linux-watchdog@lfdr.de>; Tue,  9 Sep 2025 15:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4C327A925;
	Tue,  9 Sep 2025 15:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lDnnIUAO"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E78274FCE
	for <linux-watchdog@vger.kernel.org>; Tue,  9 Sep 2025 15:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757432763; cv=none; b=Qg1szlOEVLtzolIvYDsgvi+HnFPg2fnqJNqEdDANWxMNAN5fOjqo8jruxgl5XqVhDjmy4UleBNNzECtjXGF8Lcek0KSd9I8XpVUp0v8vX0BRfaLs4xmCsZsDqZhIXvnDKyLjjtqUyiBgj57agEuS1MuBXX53lIScatFGZSI3gXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757432763; c=relaxed/simple;
	bh=eFTweerjZKoxxZ9uYEQWOOFH2mTOPUrpeBxfdknONn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VyhYYu6Z49SYjWy0FLoTFOOczUm/MTymwt3il+DBja00HoWO6ytWFhA/bI47xxIw6eGOKQIOXbJIJdUtTscuU1+D5daZkrGJPsA41M9N3Yy9j+yNP/lds5Dr6CXwFLMzuP2uNDdvTdeCWdNSFgZU8es7bfmaoYbXcjgf8dvH/nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lDnnIUAO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-25634c5ebdeso26004025ad.0
        for <linux-watchdog@vger.kernel.org>; Tue, 09 Sep 2025 08:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757432761; x=1758037561; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=uNQdE5yOZswVE6LCOBdtsDcL2XOY1LZAHNkE5x3LHnI=;
        b=lDnnIUAOtFgMexvNa+Ivr5YnQets4hc5S31jsEvw6+cEA5R2DNLzm9CfX/kGJk4kj6
         LU6idXKFRy1wnNX4nQrmDJoOdBAy9Sn6RYi03lrWSJRqv15cODL6rtLXZYiItjEPCgft
         g4d86WvO9foxPyddhqczIgbvevvxls6HmIjysXDuPZF4UuLYekJwUKjKK08LJ37sKD7g
         Lj6CbqTGiGhpwkAdNQgyb8QYF56O79fWUIrix2W5StybQuKEmhlcwSX0rORNuFftWSPx
         gQr+lIt9wi7vzbd7ZmPppyYyqzxIHbBWvlO911Hc0MSLvDry25GUkROuE2pHi9hcujYO
         rPdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757432761; x=1758037561;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNQdE5yOZswVE6LCOBdtsDcL2XOY1LZAHNkE5x3LHnI=;
        b=E9aazoBbkRbZVp0Ls6RzaPdiA6y865DieVEDXYMuWyo8J7WnQTba9cNeIsgB74CZRi
         bLNRdOVxZs8LofPKcMGNBab2RJK4QkTVdrppWc9NZ9EyjFKH1H2/7kVObbi92LWubV5b
         +ikpQlyUFUG+FD5wKaSy4KmWcRQU9okBX3MbuY+Hm88bAMKPOLP9Ni+vficd5rgJYd0R
         4dZRogHUqNog3K3a/+waqeaVRQramd7DwSM5pBo+5V8+ZRXWtFWKGgSRdkyDt+FfMQj8
         lNiONFtWcOVopVl3QTKRJuSfkWlxPDZD1wHcMyWvibA2ftWRbZGVo+H2/6fjtwSREJTT
         v+Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUIDXvYn6s73oVZsjov1WzZmpq7NZffQ+tuCY5hmegtDmt/Y834YPAvVNT9sYZcPJnXsftvRPE/B2h0Qvscjg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzesvESSWG+CbNV9Qshh8BBlu4lg5G2CLBguFU82cmkUZsFPtl0
	qCyj3n9itYnAxlXdOESTLjFEz6QYmuf3w1ZaVq2nGUt/oOdU/GUKfK2M
X-Gm-Gg: ASbGncsuCZhQyvFeMlXnMEsumXeJLaWdLR38/vTKQef8npU/I3SmGeTjNdkVe6DSt2v
	e/8yDZgaQKzRDF03+gLPr5F3qkysvB6k+lNQcclIk4/WGUoDLK8nWEnKkI8nxL/DoZM/Rf16FoD
	4Inza82cNeywAtue16Opto2rt9mlZbcLHYW8Qe/5S5HhgqESjV3C9nIeyIV31J3RceK0ngOiISy
	hq31U6nGV0p1stWnMID3TFN3mWAi8+kx9nbzWnOTX9x1GWNWAFULGchORNSY3V3JAifAt9gXqWn
	/b2h5kDtXKpQV7GtO/AcxceFPdkoIUteuhaag6uOsCi2GWFQBa8D5R7TNyxPNK5M2KDQUGqUoqw
	ppylwOjgg3jvNBUUr35dnNcZAf6sbRdgVXN1vNQhvpr0YyJel+pxbAQ4DguJ3jkIhff2nLVqodA
	Ov9I6Okw==
X-Google-Smtp-Source: AGHT+IHEDLcvBUxgy4It5qzR9ySfj35Jxho02ojFfBjGPyU0POXrSQw6ivP4uGSFnQuh/rPMRMmzJw==
X-Received: by 2002:a17:902:d2c2:b0:24d:3ae4:1175 with SMTP id d9443c01a7336-2516c895b06mr197733895ad.5.1757432761326;
        Tue, 09 Sep 2025 08:46:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a2ab0d88asm1270235ad.111.2025.09.09.08.45.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 08:46:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f03fead0-39c4-4d06-8934-bbc388d614fc@roeck-us.net>
Date: Tue, 9 Sep 2025 08:45:58 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: Convert nuvoton,npcm-wdt to DT
 schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: openbmc@lists.ozlabs.org, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250909142201.3209482-1-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250909142201.3209482-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/25 07:21, Rob Herring (Arm) wrote:
> Convert the Nuvoton watchdog binding to DT schema format. It's a
> straight-forward conversion.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>


