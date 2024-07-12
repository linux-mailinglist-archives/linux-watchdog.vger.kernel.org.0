Return-Path: <linux-watchdog+bounces-1366-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FEC92FC96
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 16:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 37BE41F22833
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 14:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A5D614EC7F;
	Fri, 12 Jul 2024 14:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NNZabkAN"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE32C1E4BE;
	Fri, 12 Jul 2024 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794630; cv=none; b=GLxxG1lQMq5q1Hj1BUZ0u2MGFRDXTmgkh3v1xeVG6IPNQ4Ce7NHjjyhomWHRwZB5d14f1hZLAUfV7xOJ8YaUMLoqvyW/PVzBD4YpP4X+nJFmd/qlICqc8FgqWJI2g5NEGednmC7cCuM49eHH35wRFUmKuNIUGwygGxBYvBkaQ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794630; c=relaxed/simple;
	bh=alcBCeBHwiXj0n+hXF8W7ZUTjf6ut9oBuOsr8yu14vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxsN2uWG6lhuBlQUUGz1TBHHBMRdI/XfecSWduHTxSMOmXwOgeEDA/W4zQ9yq7kpq7AFJfhN9Lm4krY46RMSykyNd1qknHcO89biMvibuZTezDER/0BietA4iaJ8aValrlAjTUBYgkddhzmsMMF+1+KzSef8uBCxNX0LgSJc2NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NNZabkAN; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ee9174c5c0so1991121fa.1;
        Fri, 12 Jul 2024 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720794627; x=1721399427; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alcBCeBHwiXj0n+hXF8W7ZUTjf6ut9oBuOsr8yu14vw=;
        b=NNZabkANmpZMbNt3zgtwFP0t/ewewtbDvusQ7JtU4Z+I+6w0BeXsY12SvY+AVIt6FA
         WhVCQBjSdnrvsZMYOxg9OVyKtRMjUat3Y77fmFgv1AlnsmeMPeH89RTXKN12zOPnSNfg
         AUHmTT4KJO1I0UzV0UgjoAB7C+O+L5IEJ4uf1Q1y+x6dLvwoTG25DrHWaAKpc5zZHZ1Z
         zDcMYTXuW6Jk7dZFhntNFh0ks2pYbWNKmLsOc050Etv3JhnLn2BathoEpplRbg6Lc7PL
         1uFT2PVw9fCsV+7utpNUNJBVh29kpft+UD1eAGgu7g6weYBfUQ5KIOwxDXIOmOufOT6g
         tCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720794627; x=1721399427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alcBCeBHwiXj0n+hXF8W7ZUTjf6ut9oBuOsr8yu14vw=;
        b=OQpk892MUxvaS+0LbF+697zyMswtsO7wFWCQx++7OG+9Sc8j45m0Fx0CLQQlTlsLHE
         RRDVwqg08XL5QuIO80iDgQDZFp7rH/4kZm7lCL9U+r2FsKnESIwMMvLnU89L5jVpk7xU
         62SAdLjyR/khGFBp0w1mEqSF6emIK/JnRgROvXlR+ZlUGJdzF5E69qqO6vtxXNKYDz7V
         xDapoM5vbyEj0PVCQw4waKw0hiOg0dWJ+a2gGODobMX6wmKnsVtpHnvNQr4yNI9T+kHR
         FgeYLmJt+4kbIKOBQFKpa9DAn/Jd68rqCxOG2+0Eon4kXxWhFoUN45+W09FlPQLXsftO
         939w==
X-Forwarded-Encrypted: i=1; AJvYcCXBT5F7O1pxSpgS4U8dVY9lDGq5u4pomnvcjPFiHAtobwoDh25EOaaSGlFYqS/rtS+YcFFSt/W/qlseHlb8FoFame98fvkCk1K9Kw9F3B2xcl61FQu+grTEqjG4baglUa6XM0VuH7PxBZDwCyU=
X-Gm-Message-State: AOJu0Yxz5FY7tdJF3zQvJy5ozhlxkZYzC8hyemSd8jqK4KOPiLUK98q/
	dNfWxAZiszHjwSC0TQFYXx2wOyPp9nmhijZBgjMDND0Yn5ihBNIsTMqLvldxkxuUYqxj8fDWcgh
	jdQTawfLjT0QytIQwNOmMGjN2lAlXYw==
X-Google-Smtp-Source: AGHT+IG8gtYHcWhYIa/raxAMEUfMDAXaH2ixSD7lXeKGzT1uyDGpJqXE7og93Moj5HtYaifBaQHPa90q88CmIKnndh0=
X-Received: by 2002:a2e:9859:0:b0:2ec:4a95:5f05 with SMTP id
 38308e7fff4ca-2eec98bbdfcmr29501431fa.3.1720794626549; Fri, 12 Jul 2024
 07:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240712141844.3274214-1-Frank.Li@nxp.com>
In-Reply-To: <20240712141844.3274214-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Jul 2024 11:30:14 -0300
Message-ID: <CAOMZO5DyP_V7+hSGm6q2ReTUhQ6ebTaLrx=qNhkuFSpCHc+8NA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Frank Li <Frank.Li@nxp.com>
Cc: linux@roeck-us.net, alice.guo@nxp.com, imx@lists.linux.dev, 
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org, 
	ye.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 11:19=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic fo=
r
> difference compatible string.
>
> i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set

s/needn't/does not need

You mention i.MX93 here, but the code touches i.MX8ULP. Is that correct?

