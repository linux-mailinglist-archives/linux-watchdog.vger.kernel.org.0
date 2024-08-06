Return-Path: <linux-watchdog+bounces-1460-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 323959495D0
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 18:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B48921F25B25
	for <lists+linux-watchdog@lfdr.de>; Tue,  6 Aug 2024 16:44:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601343A268;
	Tue,  6 Aug 2024 16:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUHZXTaS"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41803F9EC;
	Tue,  6 Aug 2024 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722962661; cv=none; b=H9twcdj6Ydr7gyCuVBNmKChMWib8zmMNoQYJ4DHHe3wOOOgUhKDpnE2LAClsPiOfCVaRIW91SJdWq6ZWlUNyiXJA4za1h2LdZXKq5ywx6lhfz3dD0iXZM5ncD5BTfmE0hRkZ4aCp9MvVAZ2KsxT7r2VYAc/Mqbol04BKfoJGj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722962661; c=relaxed/simple;
	bh=LH2Uy8/PpAWYUaMMR8gc2ewziMO8ttQJx9j92qR3+kk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E7pSY2Pk7338AxScZizCR0GLHb3D7MDXXka4nKRHRFKt86gUFkHyiFmCksp/DlCBfncQCq8/CwRATnDf7mrc0J6uYpOfoO5z/FBLj/SAtkqYnSoIbRMle5utWmNNJsIAL6JQ7KBln3Gk03g3SrySc6fLNsBeK+ZbXU9dK+Fp3zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUHZXTaS; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fc49c0aaffso7167215ad.3;
        Tue, 06 Aug 2024 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722962658; x=1723567458; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=6u4tA8v4x0UysMy3fqtmnndZc1v59YAMyuI5VmHB8EI=;
        b=WUHZXTaSX9gyzVMmYIYNVF1O/pAjnBeal1RtIboVNE0oh+FeibVQEW977oMKJwXDPu
         VVcZfu6uarsvezl082LZPwo0HrGWYFolJMuZOTOiCPvMIVLHtCRPGn7O2Obq4pP45O7+
         9CcR4Ern9qfTbaMGAPuhfAq2hHUF0QoUnjihgaurLLhG6LxOfIxGr69BnVCJv9Nhb1Lj
         FzUSLRNokh4ZJvccGK5xjADIx+/80GaTafOM6Rpx3Hze/yn572lLWKFidwcfZ/y/Z8wv
         j5NeM2CVub5paQvCgCI30CYIGuSKJtCXNMnsDwKFJWoO5uSeMfC4lU25MyH+Ned5r5Br
         u4IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722962658; x=1723567458;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6u4tA8v4x0UysMy3fqtmnndZc1v59YAMyuI5VmHB8EI=;
        b=CXmdPyR2sfldULVcFRTNbB4JSKR0phKShlCn8SWwfPJ1jc9E21jfqVs2yKOtAQb2/+
         qKLwAzmWTcU4S04FFip3fS53FJdvgPB3w1bM+SWcfiYdySp4p+Uakyet1M01l327z4tr
         dO7WhmUo1x4u8KxPJkDUCVcdi1L5Ky08TwPrNTgVdvPLIh7SiJ60d3PXq2QZm/7rzYaV
         sakonN9YI2o7sHsHNff7fB1PPOb5ZYQhZOmZzKcWISoCR8hp1w2Crt5ih6nC7/qf0rUJ
         TVQYuXMSd6YyD9GYiQw3er+HkfwNsVW0Zj0E9MN7loEWwjkzhA18RNy5niJXWgTCfp7n
         Ly4A==
X-Forwarded-Encrypted: i=1; AJvYcCUiC6DGUZgnrb3kV8ZDnDeX/87OZx+zVX0iEFJzB4QHnoNunumsOkNuKLYiMOUj2FkA3SQ5Elo3q0m+CDhX1T70Jh6ZTeasgenRvER7fu4H1XcBS8SOiOa/HNZ0JOMMRTcZ6UthxQf7XHdWFNdosPWnCvpTbgQvf9P35nCJbG6q2qNvoRGlDv7Y
X-Gm-Message-State: AOJu0YwbHBfTMRBgTDQnmNc8mEJmHYwIP6RFSYEaf4Ef+GgI4urxEioC
	YmlZ8edws1/cWCWTaBkwjuHLr+IeHEja3Fkb8LlVayosSEVfzH1H
X-Google-Smtp-Source: AGHT+IGlhBaOVnvK/UiaEh93n4akX8Vh1cO4RIxT7xtBfOk9/XMFLy9mmBdPQF4JA5iob/CTIDnaVg==
X-Received: by 2002:a17:902:ecc1:b0:1fb:4194:5b78 with SMTP id d9443c01a7336-1ff57462826mr164166625ad.47.1722962658135;
        Tue, 06 Aug 2024 09:44:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff592ad9e4sm89259485ad.283.2024.08.06.09.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 09:44:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a03c0609-cc13-457b-84ec-5880fc553bd8@roeck-us.net>
Date: Tue, 6 Aug 2024 09:44:16 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
To: Frank Li <Frank.li@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-watchdog@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240806103819.10890-1-animeshagarwal28@gmail.com>
 <39e9fc4a-64f7-4695-bfd2-1f77740714c3@kernel.org>
 <ZrJGFk8+tgukCeGg@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZrJGFk8+tgukCeGg@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/6/24 08:49, Frank Li wrote:
> On Tue, Aug 06, 2024 at 12:43:07PM +0200, Krzysztof Kozlowski wrote:
>> On 06/08/2024 12:38, Animesh Agarwal wrote:
>>> Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema.
>>> This fixes dtbs_check errors.
>>>
>>> Cc: Daniel Baluta <daniel.baluta@nxp.com>
>>> Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
>>> ---
>>> There are 12 similar errors related to this missing property from
>>> different blobs.
>>>
>>> ./arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: watchdog@2ad0000:
>>> Unevaluated properties are not allowed ('big-endian' was unexpected)from
>>> schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
>>> ---
>>
>> Not sure if this is correct. I mean, technically it is, but Frank Li was
>> removing big-endian properties so please choose consistent approach.
> 
> drivers/watchdog/imx2_wdt.c never parser big-endian. I suggest remove
> big-endian in dts file. I suggest keep big-endian only if it really used.
> 

Agreed.

Guenter


