Return-Path: <linux-watchdog+bounces-1495-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 995DE951FEE
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 18:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BF0A1F25D98
	for <lists+linux-watchdog@lfdr.de>; Wed, 14 Aug 2024 16:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D8081B9B2E;
	Wed, 14 Aug 2024 16:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvd7wWM9"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8E81AED24;
	Wed, 14 Aug 2024 16:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723652869; cv=none; b=dEAKdyUYC+WtzM1s+eVy/gRRD54SHzuHEwbgLTIQJYz8Auy/ToHsAWgWM6hJ22TmtFIyw1rrZ3+FW5FdwD5TdmOW2wL0fx0YEw2+hFw8M0S27CJzg8L/es3VWBI54ErEfJHVpDJtes4wynPzDjeSrp8DKFODp/+xdHMZqmTzl5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723652869; c=relaxed/simple;
	bh=SCHhtiuOOre5UIbLOojVF8ki6EgWNqtLzrYpLiUUYa0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sh/1NtAgz9B3zR5ITGbxBlMYLwzhTS/o+PQ+s7JSlhRHtd6vV0R/84cWN6ZV30mZbUcUBsScG/TsnpWZr7xUo8tIQ5r2wrmGPox+OYo7Fu4gPXmGejqHXWkMspcEcttF7ZfOHgN6YVYEf5N3LQOvM9o/z9S6d34jXxjT63d/giY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvd7wWM9; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52efd91dd28so2838e87.1;
        Wed, 14 Aug 2024 09:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723652864; x=1724257664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5MPQ1QUqseOgwKYNiAImYbxJzlGOMm4xDJh/aLy/Nw8=;
        b=lvd7wWM9lYF9TpB/h87CnRBReWrvYS6wQTN5LuHYNgrNQXtsgk3j2+SRZL7gFvKG6n
         AoMekBNGJ8NhX/bcw1fSFG+vjZkYNhnEm8RChTASUbn9l7hD9U7IOv19P1NDzHxiGalT
         UC8ntKmtdpP7+dBfDkMHETKwMn++IskFrRGafjgjImzz4Efu7E3abRa0ByLMSlWsUFor
         HqrZPx7rYgIR1xWqYrWAsijHvu9Qp0x32atcepLi3nh1LSG1sH4D8Mp3VTnkdAP8cp9Y
         6PeafbDGRG6thVjhaH/w8Y0ylMeoD4DOSwDV4LFYNyidqNSPbOy/GvJUZ4ICUd/CgkTJ
         JyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723652864; x=1724257664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MPQ1QUqseOgwKYNiAImYbxJzlGOMm4xDJh/aLy/Nw8=;
        b=KORJonutl0tivDOCUmdxvV2zb3yznt9yjwyEn2liMuA/CbkXYsI2Gi08qAAyLZ0LTF
         ShG+vazqQjZi7UUzzF9ca1wEJDGhG248bkfb9YuxpcwsS/q2pPm1bym8JsvPYc20YsB3
         0kXOMRCiLYs2ff5ipZVNx3wVPn/bFHJ+BgoOfYM1kFvxgMpinuTU5AZTV7dvr9a/gt5b
         IVquOWbdOiW99hgQ2fxsB5aDIo56UKSmZMNR+zFD/n3gfZ+doVWkdRUnAKyNr3dmPBnF
         UeQ+d1Rkg1sVaixNmnB4sQVTy6DM7HCLs89tEjM8EEPpfYaZUT13R1OWrAfs1u8CfXVN
         IlNg==
X-Forwarded-Encrypted: i=1; AJvYcCVKoN7vLGX/hNFYrmPbL0pCl37jZv2ouNmxbBxTDCjtoyV0qdNXi+RgEFnrC62WtB4bzZZxZedg1Rvh@vger.kernel.org, AJvYcCWSUqOSSxz3t9eQeg/iNHtcI0wnLioVVeswQGxlbYaIBt3M+jTCnSaIFF8GUu/zIl5GwbXOCWQr8SSIkd6T@vger.kernel.org, AJvYcCWzwPHCwXczD/xZCQRePivYDZzcX/bRclBHlPl2f94Mw0PpmsDCuXDFqI+DDZBL4YAyWjfpodSGr5xxdr8dpbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwysDj0Q/kGaQ1D8AwEnDzU7RNUzIcxpsQnus7rTLI0jgdFPS6j
	t30b2Y/9Mn1vC06gPFEFJVljK4BjQA1IT4NVU2HU3LoAYj6oa5Ayjnq1yMFqkIj1Wn69aCZxWqv
	kprlr0zSiX0Oq9b/dM86cxuiyn+w=
X-Google-Smtp-Source: AGHT+IE8T795cCVhLDVAkkR6XeRgBNw44XWGGSMe78NC8Z2bOheuicfqH7HWm4YY3z4o9PP9bb4zlgA2+xLen5QhdKU=
X-Received: by 2002:a05:6512:3f0f:b0:52e:f99e:5dd3 with SMTP id
 2adb3069b0e04-532edbd08edmr1178690e87.8.1723652864100; Wed, 14 Aug 2024
 09:27:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240806103819.10890-1-animeshagarwal28@gmail.com>
 <39e9fc4a-64f7-4695-bfd2-1f77740714c3@kernel.org> <ZrJGFk8+tgukCeGg@lizhi-Precision-Tower-5810>
 <a03c0609-cc13-457b-84ec-5880fc553bd8@roeck-us.net> <ZrzPNmXLsqxjzM+J@lizhi-Precision-Tower-5810>
In-Reply-To: <ZrzPNmXLsqxjzM+J@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 14 Aug 2024 13:27:32 -0300
Message-ID: <CAOMZO5DOUbhKHOfX0z+hV0KtCsqN0ta=S1U64QXKNSExHbM_Kw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
To: Frank Li <Frank.li@nxp.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Animesh Agarwal <animeshagarwal28@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 12:37=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> After Alexander Stein point out, check spec, and dump watch dog reset val=
ue
> at ls1043a platform.
>
> 0x02A80000:  00 30 00 00 00 10 00 04 00 01 00 00 00 00 00 0
>
> It is big-endian. imx2_wdt.c use regmap which call regmap_get_val_endian(=
)
> to handle endian.
>
> So this change is corret.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>

Shouldn't 'big-endian: true' be conditionally enabled only for the
Layerscape platforms?

