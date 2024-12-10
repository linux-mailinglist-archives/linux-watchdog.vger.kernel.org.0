Return-Path: <linux-watchdog+bounces-2519-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 114EF9EB122
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 13:47:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CFD52864E3
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 12:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36D31A4E70;
	Tue, 10 Dec 2024 12:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="N5GTBVsG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140E91A0BC3
	for <linux-watchdog@vger.kernel.org>; Tue, 10 Dec 2024 12:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733834818; cv=none; b=NgY6oDBELxd6F+wFaHus80TuTzMQC4LUpElpfSssBzR12Ky3eZfdqZOKtR5cZ/fPh9q/+l0mzlrZP1bNVllc6Bziv4HypAovgLFoI9FgEXCJI/+iw7SXG23j4uYyNJXcbu0zSX7LT3/9oxmwsaSCsD9PI9oQW3pEdfMUrLOMpxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733834818; c=relaxed/simple;
	bh=KX4EV3S5tpdSVPVaMW0IgVo/XNFVcw+zGMXFSjwdn4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EiRvtcvHODWNSN3ONUWlJNdDPuHeXRLFcZSyAETRuHWdOyFJsalmQBqi/iqxGmMK+YXHUrMGhZK2+Zl0KpIKLZPG/UrlpJXZTKebKLUtZ+qW4P3+sAStLy5g1peh9aU37cfthPFF/yuRtsBlBmghZyD5eWTOtnXlvr+czuB7MHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=N5GTBVsG; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30034ad2ca3so27687711fa.1
        for <linux-watchdog@vger.kernel.org>; Tue, 10 Dec 2024 04:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733834815; x=1734439615; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2gv17yRT4z0rHDfJ0xNPXvIsRkRnNe0DZfYlBqVB+Y=;
        b=N5GTBVsG2KMmwjiFXXNZANCiDdkUOMEhZXubJTwofUPnyPJfittosAC9P85mzVRcUH
         m1f6AVL/CWSwuJ/9xgi2NmpmQVIR9Yb32Nfsd7P6xqViG6WPfpSp5oCB/UsFnQkk9Cnb
         z1KIfeQUX1c0ob0E8NQmktlYOJTBjZlb+7YKZnCL9qrw3D1LUJuUBLeXxGF9aDR8alkp
         xmIZDjVBiYMtP6SDIvy559XqDYGBGWVQEscQOUVYL/uuqVKyZqI5U2p0I4dtUbViHixk
         WraUB39L/Av+uWRqoJfwJ6383htCur/3f9CAi1UskwuBuzUDkZnRB1ZEIlrdZLIJzCQn
         uBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733834815; x=1734439615;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2gv17yRT4z0rHDfJ0xNPXvIsRkRnNe0DZfYlBqVB+Y=;
        b=hHxPAdScBc7bdf0FqgoHtsEhEqaPNwP5j5QArmwYbeJYqC3V8fSiCdz0YnU8ntwiiU
         21jsj9J+HLhw3qmlwGJyWBPbdiEbojPMbPSdzWdHiuesOFLtEV697kYW9t0cxux8aYPK
         QJDXYyr5v5Aq6Yp7nX8ljYrtINzNDOYV7qJqE7f1qoCMXBDM4lCnIQhqfJpyi1+vgl0P
         TeenWdp1tq3ZsVAlthy9/w/xYcVjod3AH43EHCH+hdhwFx+4myU1tVUJLrnXmf3Cc1/D
         R7DCXW/62Q+I7zzELjaXAUqMrME2Q+a+6XRetOIOLqRcC8aKLFA2aATC0WfNHUuz1CMV
         hXbg==
X-Forwarded-Encrypted: i=1; AJvYcCUHG11rX6zt7JUZyQ0J0JHEq+Xvdf/YdpUyFATgRhSrrMrMzKJjIwIhIM/VYolUGAb1R/uiBC6Za8Kz9WJyag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcJwla+T7Upyo+zsZYojoPzLGnNkIjsA5vTckYNLW/E0Vyu4L9
	XfzvLwuMhflqbh8y0WJrg/yNr8DNBuws6xILO5+g+9ut75MQyO5IcQCM0jIK1dy/Bi7nap7JaP9
	gT6XscJg5Es4Na0fLOCPxltYQiUidkRAMikoYLw==
X-Gm-Gg: ASbGncvKs9c5phez/sbazEORHhrGZm0n4UkwycyYWHyXrtdfaNpRza1V8mJ9MJMR7q8
	cp9GGiBjDss6srMAyGBI/M5aGdYyu2mS9WbzaeE0UaWhV3SWsUHmH4Seyu5XG6JyaEyw=
X-Google-Smtp-Source: AGHT+IGlGjnX41lf5nD3xaDqv4/+1zouMo9m8MDdOTdpToJj+sYN673kMGyE3ysEnuS7DFynzHplBUGfucHdrqsCYuk=
X-Received: by 2002:a2e:a163:0:b0:302:336a:898f with SMTP id
 38308e7fff4ca-302336a8a1emr6922311fa.9.1733834815083; Tue, 10 Dec 2024
 04:46:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-3-tmyu0@nuvoton.com>
In-Reply-To: <20241210104524.2466586-3-tmyu0@nuvoton.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Dec 2024 13:46:40 +0100
Message-ID: <CAMRc=Men4QM3a2rydxDYwLjJLYPB7Uid=y_DJ8YNa-So2H3NQQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 10, 2024 at 11:46=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:
>
> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---

Looks much better now. Please address one more issue I just noticed.

> +
> +       mutex_init(&data->irq_lock);

This is never destroyed. Please use devm_mutex_init() preferably to
not add remove(). Also, the other mutex doesn't seem to be initialized
at all.

Bart

