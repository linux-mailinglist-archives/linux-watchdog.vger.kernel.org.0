Return-Path: <linux-watchdog+bounces-1368-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D8492FCF2
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 16:54:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 744E7B21076
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 14:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B70171075;
	Fri, 12 Jul 2024 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iOpmZobR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EA1EAC7;
	Fri, 12 Jul 2024 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720796068; cv=none; b=lviOKeve9eL3npI4eBlH0OIFgegp2GjNl15AthIrkBZdF6oao6mQcutUxACzObb7CEzmJxGCGmCBP5KC/CTDF8mmN6lWJsyYhWfZe1Dh8MOqvs69Y2DDuucTBCXrWjIIpljie9Q68+yXM+QMtmSP7M5W+55LmkWPsGaIh00jt2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720796068; c=relaxed/simple;
	bh=oZnP4bqPkk+o/GdAa885VaEJ3Pa8Q+n8ng3fh+ry6gw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IdGQFYQpqnjFQrbn3O/6ifkfCA2kCsSOo5howfk0QR/k3FnuTxOuPft/q3o+WAXFLp6THlnNnadM9HOw0wCBpE0aWmHC3reeZ1BSU2GypHUFVPFwa+HSgMatLUAVzLtUkaof9EEzdt5d/iK4BWvb+rcb1cYljJQ/pEbtjbveJho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iOpmZobR; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ee9bca8652so2377931fa.3;
        Fri, 12 Jul 2024 07:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720796065; x=1721400865; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZnP4bqPkk+o/GdAa885VaEJ3Pa8Q+n8ng3fh+ry6gw=;
        b=iOpmZobRatG7VdyzAYsTmaazfiScM/cTUYY9PUp8b/CIyXLdRdB1J9YvR+nrrwP0Gl
         8pjMH8ehvZs0+lrLTVh/x54I3OjemBhh9HM7R8mkACEM8LGdO0x8WNWqNoonHYzVzb7m
         2mDK6oxLEDmqQcVI1zkkOAhM5FkmHwftuppsGoX40Tyjmonj8fvlXfvegVQKuxngLljh
         6wc79s19Zfmu8PTPQuh9Bz2HPPDDnM4H0lnGzSw+CBdahN0COjc+5PXybdE/Ogm+jPwE
         getmZ4Uoa0UIvvYTCQ8sXXpgKnAwa2JRv1oz6qZ/jfzhPr7pSmiNbLmDxxekT4omnsM+
         uIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720796065; x=1721400865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZnP4bqPkk+o/GdAa885VaEJ3Pa8Q+n8ng3fh+ry6gw=;
        b=WxzYeb2w/Y1unvlD+XISOytPIE7nc3hln4IAICN5f96oyAQrxeR0ewfrW3XkBxLCNk
         71YxFWOg2egsCWvZwV4qLJMfPUt0K51J/f4zo1Rj3vtkpFipgjGq5yaP8r5Ge24fhf2E
         prSVsLeMhlvTr1QjFAM8YymB7/O2m70YfpA+GEyNfnyzAcu11csZwZmpPM2Q7NJ5za0M
         EUBD/g6BREk+FhYhwPu2hB5HU+sADvgonvbzfTCK3s923IYPgqxJrQkG71ixT/SGP0u8
         UagAQx+gE6yIJeUj2xT0Rr22kJX1VXXtis2pD5DGS9vO509lgGKf2TVeAAGmC4DtlH3i
         zOug==
X-Forwarded-Encrypted: i=1; AJvYcCUY+brF3z401RqgDjBxeGePsNqWmxtKXm8JIxZr3GSbtH5OltWDTQdJXS3NJrGvYpz3FXqGzhcEN3Xa+WyKyYqVOVI2rSXFzeFbxNA8tRAwEHXkSOoMXdoXL4bLDJkHLL4K4cKX+x5/wtc3lwY=
X-Gm-Message-State: AOJu0YwYHBZ1vYuM0H8jtkPUtuxCw6fh64tZrO+bFoqC2wNnKhJvTfaS
	mucCoEEdvnS0KIKzPazpbnaYY7T5ZYKgezEGiMINh26jjEhhucWsHZrOFLxaFpv72CvDtvTyxK6
	BuMl7lWqqfV8rl/wKicFmftRHK3E=
X-Google-Smtp-Source: AGHT+IH/V+4RuMMP1y4zYsMr3Q3yn0/UVcWRFpUrpBf/8WyoZC0+hb7EngLvXStJlZYCrRKOZeKjxOC/+Ux6x8JjAy0=
X-Received: by 2002:a2e:be05:0:b0:2eb:e6fe:3092 with SMTP id
 38308e7fff4ca-2eec98b4de8mr35608201fa.4.1720796064757; Fri, 12 Jul 2024
 07:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240712141844.3274214-1-Frank.Li@nxp.com> <CAOMZO5DyP_V7+hSGm6q2ReTUhQ6ebTaLrx=qNhkuFSpCHc+8NA@mail.gmail.com>
 <ZpE/6VM/DbCoVg5c@lizhi-Precision-Tower-5810>
In-Reply-To: <ZpE/6VM/DbCoVg5c@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Jul 2024 11:54:12 -0300
Message-ID: <CAOMZO5DZHBuGyCbce5RajNXGCFtSZ60OG-Su8QfXR=CfQpjosw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Frank Li <Frank.li@nxp.com>
Cc: linux@roeck-us.net, alice.guo@nxp.com, imx@lists.linux.dev, 
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org, 
	ye.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 11:38=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:

> Yes, default is disabled.
>
> Please ref v1
> https://lore.kernel.org/imx/20240711-wdt-v1-0-8955a9e05ba0@nxp.com/T/#t

I understand that.

My point is about the commit log: you mention i.MX93, but you change
i.MX8ULP. This is confusing.

Also, better to explicitly pass .prescaler_enable =3D false inside
imx93_wdt_hw for consistency.

