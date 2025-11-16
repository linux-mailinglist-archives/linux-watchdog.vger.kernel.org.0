Return-Path: <linux-watchdog+bounces-4593-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D02EFC61001
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 05:01:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 756E64EA5B7
	for <lists+linux-watchdog@lfdr.de>; Sun, 16 Nov 2025 04:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BFFE1DED4C;
	Sun, 16 Nov 2025 04:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dGQbMKFx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E766B21ABDC
	for <linux-watchdog@vger.kernel.org>; Sun, 16 Nov 2025 04:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763265694; cv=none; b=H+cNJqcm1dLGv2q0/DmNShVi7KBmqFEiQxb3W4dxdN1sJfKCB0hVgJOsqlxIE5uKcfwo6VinWu7eHwtLUj6Sx7CNMTROeIU07guKLxc/TTmi9utQqeXm190ckSX6mSh5HoHrwuHWxHMq83EUk8rfHrw4IQBj4Q8li1K69E838Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763265694; c=relaxed/simple;
	bh=ViKmEBt094e+TEyrkD/7l7Omxa8P2Y/BZpUwUU1mz/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TlRbHCOLkvqAXdkM2Qk8WLQ/PxdccdPs4s+86tsHskWtzb5KWQgZRvSD3IfD7ZCOomOSSCoWq4iLY/8uoTy9jIKGqAUfptqkWbJm3b834XA2y9Df9f+dVWOjTUpzs2NVZkcfkVmbG2JLGZTh7f3Tp3vnFoldlEBVIDDFyyhKf+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dGQbMKFx; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-591c9934e0cso4456054e87.0
        for <linux-watchdog@vger.kernel.org>; Sat, 15 Nov 2025 20:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763265689; x=1763870489; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHOnnfu2WV/v2N1dBqAfZarNGYxVE6UYUn92Rk5owLE=;
        b=dGQbMKFx3L3/JSoVq4PElnac1G88MOeTDapELS0ntHknbudBEZWUwpVA1cxV6u6HqL
         sAJWF91hDEtdMOsQFXm3eHYlAulWbmnPK5epxa1US55MaeH4vdRqNftc1giqfknF26//
         GdRrgFyxiOlbAFQLpsLkFvv8w08DlCLNZ3GPNaOxud2I1nwPYjsWOP7GwSg6YwNkZ8NM
         HvDVTHFntGGu+9HCG2AQEo/5z0MvP9/a+psaUYH8kdss2qqQ6EskcO+GnsSwTaI08M3f
         3Cr7zNNgcXd1MypKSXAAucUIhJeAzBQjklu1cTILCltb+jlhm9s1SOrZhJ1DESZhoamW
         ugOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763265689; x=1763870489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vHOnnfu2WV/v2N1dBqAfZarNGYxVE6UYUn92Rk5owLE=;
        b=Xqd/lb1XtG1LrydC9j3FF8APMGy3jeoAzJ47IgqK4YxENHHJvCpFUjdFUj9DukYsi5
         HGunPnpNBpZ7pYRcdXVkX25ntPWsmNb9YocfVD+M0Yy4gvQdWgzOfcCrtDozBhkBAPUQ
         em9BhQne9RY77GHO2G96UYiLxttocaTj7INqMFcNQYuh97VP6m6sW3MFMhuBA4Avjziv
         m2Gsp8byuqTjstHGmj9tmkxQbrkFL5plnY67E7oXGHRlPB12DNG0BuzrCtd8o1D423Zc
         xWpO/Lp0t4d/vJqlFDk8lEMu6rEVDUZlj/W16SytBYs54pz7sWrqOVQUJs0eXu7W9duE
         iP0g==
X-Forwarded-Encrypted: i=1; AJvYcCWNIpXlymIqmNyAbRRTWJM59Tqm+yydGrvfT+qDBWtUrXWyTvt6o3bhnT6p9BAHWilb+MHCNBspydfkpp/Rjw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuxA0SbKhSUthDvnt3Udzkj/XcQD78givQXrZQcJZfkJwUJR0B
	DDXafPk9y3DYxcUP9jHnO5jXQNXwxv6GoLT9eFOAj4Nu2blPYFXYxaNwvuNEUJE+3PadoXFve8T
	lcdTWhnWpg5w5Dd4Es9xxeKtKZidc5/k=
X-Gm-Gg: ASbGncvfrLXmWqw5fvy4zZbhuJO2WjZx3HDhiZpeznG46bxz2SLVXiqkfit5YtQ2+RO
	NmeOb5jdQNV8SzZbDpYDejOZJKLQfcCqTcXEfOHx18mBPWx1H7Cq1eZnLYEvm6WOFBzAKxKMgRl
	dKjkrlRl04/cvFiyRjyQCSMYNCK5TwLoYjrSrVJHsVgT/ms6y2vD4JAgZoEe4pDPlZfgnhWAjfk
	hY5t8iYMW/ixBfjkm1arLACu/2MThdKShUmVf1UpP2MNDCxedre/1VxCdEgIuD+nYi/pkAL
X-Google-Smtp-Source: AGHT+IGVtK1X6QVCCFl9oUOkghvq4uLoqfDGl5AxVVwOhFqg/9cS0AdZlrKDx+vFfKKDxtJFS1HxkFRUicMAHzHBZTM=
X-Received: by 2002:a05:6512:108d:b0:594:2654:5e3c with SMTP id
 2adb3069b0e04-595841f0b71mr2840106e87.33.1763265688745; Sat, 15 Nov 2025
 20:01:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1762482089.git.zhoubinbin@loongson.cn>
In-Reply-To: <cover.1762482089.git.zhoubinbin@loongson.cn>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Sun, 16 Nov 2025 12:00:51 +0800
X-Gm-Features: AWmQ_blIhjJIi_40FrZPKnXO2gKNnDJthQwdyLwC4vAHP_LVBvLT1GG6sptkjTU
Message-ID: <CAJhJPsX537QiQZdk-0g_4RWVYGrhFasPrOY4Np+b-aVC6j1Urg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Watchdog: Add Loongson-2K0300 watchdog support
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Binbin Zhou <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Huacai Chen <chenhuacai@kernel.org>, 
	Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For the whole series:

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Fri, Nov 7, 2025 at 2:01=E2=80=AFPM Binbin Zhou <zhoubinbin@loongson.cn>=
 wrote:
>
> Hi all:
>
> This patch set adds support for the Loongson-2K0300 watchdog driver.
> It's similar to the Loongson-1, except for some different register offset=
s.
> Therefore, I've merged it with the Loongson-1 watchdog driver.
>
> In addition, I've simply fixed some minor issues with the previous driver=
.
>
> Thanks.
>
> -------
> V2:
>
> - Remove file and function renaming patch;
> Patch 4:
>   - Update commit message.
>
> Link to V1:
> https://lore.kernel.org/all/20251029020847.1946295-1-zhoubinbin@loongson.=
cn/
> https://lore.kernel.org/all/20251029020913.1946321-1-zhoubinbin@loongson.=
cn/
>
> Binbin Zhou (5):
>   watchdog: loongson1: Add missing MODULE_PARM_DESC
>   watchdog: loongson1: Simplify ls1x_wdt_probe code
>   watchdog: loongson1: Drop CONFIG_OF
>   dt-bindings: watchdog: loongson,ls1x-wdt: Add ls2k0300-wdt compatible
>   watchdog: loongson1: Add Loongson-2k0300 watchdog support
>
>  .../bindings/watchdog/loongson,ls1x-wdt.yaml  |  3 +-
>  drivers/watchdog/Kconfig                      |  4 +-
>  drivers/watchdog/loongson1_wdt.c              | 89 ++++++++++++++-----
>  3 files changed, 69 insertions(+), 27 deletions(-)
>
>
> base-commit: c64c2a50cdd487e2270c875c1770cd55705d75ff
> --
> 2.47.3
>


--=20
Best regards,

Keguang Zhang

