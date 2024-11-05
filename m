Return-Path: <linux-watchdog+bounces-2414-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 712619BCD44
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2024 14:02:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A26AF1C22271
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Nov 2024 13:02:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A121D5CD7;
	Tue,  5 Nov 2024 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TpG0MeX1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25FA1D5AA5;
	Tue,  5 Nov 2024 13:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730811736; cv=none; b=gysKpyjub4WUoJXCNLZxsUApW8FEO34+zcoHYi6DQrCtkKQXnPkeQo2x4NNZgMrWACOwLF2Acj8MTErS6qgRL7XMXYaz9XVDOpAxhZD/0JlPOjjQC1OG+p7YwSoe9nLySZNYdJiYDKepZHB+o0Ew26YNkMdcuOXC8tjxh0IqphU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730811736; c=relaxed/simple;
	bh=LJBE4I0IMy7jf525lG/+ykCGvei5KrQcg6hhR4qOr3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sGDlmD7hHdLdLz22/7KCBWA26X4rDLfcUBM4hy0Obht7ar/hWtsrquWk2pZow3B9lx2GmN7oKn0AFKCmFYkEuKMrYRnTu+aOw5mJQ/fKf0xJpVv4wR/qkoKepvheqt1GRHrygnkG44t9ma7LK3OmdN8Uq5bFtgGKxTYFcLvR9VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TpG0MeX1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3C6C4CED0;
	Tue,  5 Nov 2024 13:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730811736;
	bh=LJBE4I0IMy7jf525lG/+ykCGvei5KrQcg6hhR4qOr3E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TpG0MeX11BO462clx65JUfLsvq7mhYbF/8TSUt0yOb/+sflQ3T/k8A9Tp9FG63RuD
	 0636srl1MjyFyrhJc81qno/7J1qL+Mw5zrOHiBi72fuBiRN1KQ2iM+bo0HolczBHba
	 c7Uk7UP6R729XBO1at5dQ7HRh6W40mffJRYDbnJLBHQpGPQoVPKVKqf3qQ0AJguVXF
	 c+1bCIH1yj8fuZIYA/kHZ4fJ37aL3wZbWpVUbqicrQzs+vKZA8Z40vnynqYcP89Gbr
	 E6FhESgpjnUQE1vUIyasS2+0nzjEvzjuarJGYp2ekKOTE1Qe1hBKH20jbM4y/8iJHi
	 jAXlB6S3LBiqQ==
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e2918664a3fso4387126276.0;
        Tue, 05 Nov 2024 05:02:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRxEOQnvWR/2HXvLWnvoOj/RQdg9LQRAptjv1pjEaYL7SqynnnA6AZ8/lPgXietVdQRKY5ZRAfGsgH@vger.kernel.org, AJvYcCVeGy+9VEW1z/OzDmV6MjmV2PlK8maFD2XnHcLj8CyzYs3+KBMQbCEhSEVQAa4R0sNg00y5w+VLxfIGM8hy3Cg=@vger.kernel.org, AJvYcCWrlMY8JFmMchTB3hZbHVi4ZhVRtUav6RXGGLu+YPeVp4/3vDlgNcttNqqZIg/7210w0mQ7PkmNa23bk+YG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7UmIdNi73ayEMF3cPspBO3ucaFWUQJ7vV+xqJD19NU9KL2t6B
	gJPMTdgoIz/RXlcP/bf+GUHNrObHhMDsl1/VMmSz8blAcAs9GP0uMdXZExAIsGyFwrvfj14knmL
	KEUQDjZX6e5beudReRyeiHC0D3w==
X-Google-Smtp-Source: AGHT+IFFLLbvPgCz9E48Dc4uvqtjg8zV3O4+z1GmI3+QqVk1B5G6UocOVyAeLNkYeXQF7e9enyX5at0Z8dFOlsu37pM=
X-Received: by 2002:a05:690c:9b04:b0:664:74cd:5548 with SMTP id
 00721157ae682-6ea642e5c1bmr128709737b3.1.1730811735520; Tue, 05 Nov 2024
 05:02:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007212434.895521-1-Frank.Li@nxp.com> <ZyPUWaINgupm7dZ3@lizhi-Precision-Tower-5810>
 <20241105083255.GA24194@www.linux-watchdog.org>
In-Reply-To: <20241105083255.GA24194@www.linux-watchdog.org>
From: Rob Herring <robh@kernel.org>
Date: Tue, 5 Nov 2024 07:02:04 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+taEhxJVhzRpZwZnrDDrjpCPXk1vgkAvqWscjH7QPXCA@mail.gmail.com>
Message-ID: <CAL_Jsq+taEhxJVhzRpZwZnrDDrjpCPXk1vgkAvqWscjH7QPXCA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: watchdog: fsl-imx-wdt: Add missing
 'big-endian' property
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Frank Li <Frank.li@nxp.com>, Guenter Roeck <linux@roeck-us.net>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"open list:WATCHDOG DEVICE DRIVERS" <linux-watchdog@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 3:00=E2=80=AFAM Wim Van Sebroeck <wim@linux-watchdog=
.org> wrote:
>
> Hi Frank,
>
> > On Mon, Oct 07, 2024 at 05:24:33PM -0400, Frank Li wrote:
> > > From: Animesh Agarwal <animeshagarwal28@gmail.com>
> > >
> > > Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema. =
Only
> > > allow big-endian property for ls1012a and ls1043a.
> > >
> > > Fix dtbs_check errors.
> > > arch/arm64/boot/dts/freescale/fsl-ls1012a-frwy.dtb: watchdog@2ad0000:
> > >     Unevaluated properties are not allowed ('big-endian' was unexpect=
ed)
> > >
> > > Cc: Daniel Baluta <daniel.baluta@nxp.com>
> > > Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> >
> > Wim Van Sebroeck:
> >
> >       Any update this patch? Kyzy already acked.
> >
>
> Acked-by: Wim Van Sebroeck <wim@linux-watchdog.org>
>
> Via which tree will this go upsteam?

Your tree.

DT bindings go in via $subsystem tree. I only take DT bindings if they
don't get picked up by the subsystem maintainer.

Rob

