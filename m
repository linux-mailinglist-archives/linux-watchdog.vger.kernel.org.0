Return-Path: <linux-watchdog+bounces-2601-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 162B59F9273
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Dec 2024 13:46:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2786E18930BD
	for <lists+linux-watchdog@lfdr.de>; Fri, 20 Dec 2024 12:46:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E357D07D;
	Fri, 20 Dec 2024 12:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eonzgd44"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253E51C5CBC
	for <linux-watchdog@vger.kernel.org>; Fri, 20 Dec 2024 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698754; cv=none; b=RMlvzyN5uiXmuOL9PygXLpnhCb4THhloZ7V2uor2Wm7VjkNOanipkg2iP4GG5K5W5aPLAkCiuxC+Y+swwc63pKuyHJABAh2gcWt8zezaByDsPfPgjQfxAlOFV5OQSH1R/yzE5UCQVBi/kvwcMyBecNoPUKOa/sTwtSt7VllkaNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698754; c=relaxed/simple;
	bh=eIvJgkvy6HRuXmDaqsB7MX3E+E+alDS9//+kZ9m0t6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9qk6Qceo8qEHStZeLhRva6GHwe9MiwEANDzVaLw30ZvQ8Q7Gu2wKUQ7SRZFzpxw2WhYg9z8LNbQHQD7PRD3uwACy8Fx7S/6UrS0CchaFfRn5+oRlkqQfrcF3Lkb+Ijo+GQF2eZmy39Kq/5mZ55h6wadN52kw/GAfO4PGiNryiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eonzgd44; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54024ecc33dso2156140e87.0
        for <linux-watchdog@vger.kernel.org>; Fri, 20 Dec 2024 04:45:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734698751; x=1735303551; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+v+f0F+ggXM/pkSaGIpemMgLpckgFL+0mqDxCkmiPc=;
        b=eonzgd44hq3ryZG4G65d3usc9iXHmng4QZBz+h6huIRQtPiVzd8RqWpA+IvNyM+afe
         YSWw9pW+g9evbv7WQDtxPQL1j4xjpZvknXtudiwsU6vptgsEq5T45djbDMx9oq08Z5Pb
         wHpiDNUwSNMr2BRGWYATXXMgeuXmIYcaq8l8MWI7JKjIuyAS3BHXB4u2TJMn1nGUaFrS
         DkeTwG3ALTAeLR+y2oWzvNSO6XeFlCYbWXxthmz21GuYLFIN5Rthn2jPyzdNlQfyi1AK
         3Lz6v5eEoF+S0jKzSXWxiUSGNiDGB4I5CH1bDAQzsNjwuup9MQmUM2QI5e7yELEGw6fY
         rXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734698751; x=1735303551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+v+f0F+ggXM/pkSaGIpemMgLpckgFL+0mqDxCkmiPc=;
        b=YjH6cvYMvVFxfrU1RsZjD2+RzqO+1s41pQdUh4jz11k/jkGBrnlWR9O6Y+9dpZvQd7
         CRiTcoIq3jPxGjSPyjPQyf56z+X+OPN9zgaTJgmBQhTYkDo05b1D6LM8UZIGyFklqvoL
         p8wDmfCdZreGHdH8tq26s4N0sCbOb90+Xj9pDaocMs+8nAbjcyWLkjunZM32OU747A7y
         W/S5ED31P3RjBO5G1xq3CFcoByIhvWkpcG6WKFBJL/a2kUxclnR5TnQAJMGlk3Ae9exo
         Bv0xkY/Nn6IsM1FtDtUF93d/NqgUpECn1rMp1Cw9S9HjwOFGkar336wRCDsRTYsgxsxm
         5pkA==
X-Forwarded-Encrypted: i=1; AJvYcCWav6BgfSKUrT9EnZgd6CsuVthEmLjH3SkjlvfL1SOGJVyLQ9uUfQBAQh8GCiwztq5jXisw+Enz+CK22jUmFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpI93Jq5Xma0/R64K8XRMkUqY+Pr+I92KXLUiXUoB4xQi8+L1Q
	r0WK6M53luioCg6Zp4Am6hs3fQKx3qI9wq94uK2Z01PsmaMJX0voQsnBx2G/TLDZAno9YYJt8Tc
	Cuux3J6md+yYfvGC4iQwTPka4A+6Gq0Vax38EZg==
X-Gm-Gg: ASbGnct5nOOVKiOnwk8Vrv3VKCp7Gak07HLfwR96HtIyrnODFDUSSfOwZ0wdzciR6IN
	IMTKt4B4mZvqTzUkeU3cN8lwi8RUxvZfqtWVUpA==
X-Google-Smtp-Source: AGHT+IFQLxoTvDBhmmMtrluimmMG49UjGriPLeDS3/xO9K0D1RUiifqIPS/6LdImELHSoCVS/nonG7W60F+gutNSGmY=
X-Received: by 2002:a05:6512:3f25:b0:540:1be6:f15f with SMTP id
 2adb3069b0e04-542294aceebmr908589e87.0.1734698751140; Fri, 20 Dec 2024
 04:45:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241210104524.2466586-1-tmyu0@nuvoton.com> <20241210104524.2466586-2-tmyu0@nuvoton.com>
In-Reply-To: <20241210104524.2466586-2-tmyu0@nuvoton.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 20 Dec 2024 13:45:39 +0100
Message-ID: <CACRpkdZh4hCvBN=7beFEgm-mmdwSTW1fd8OZhQO3kr6Cy7P=dA@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ming,

thanks for your patch!

On Tue, Dec 10, 2024 at 11:45=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:

> The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> PWM, and RTC.
>
> This driver implements USB device functionality and shares the
> chip's peripherals as a child device.
>
> Each child device can use the USB functions nct6694_read_msg()
> and nct6694_write_msg() to issue a command. They can also request
> interrupt that will be called when the USB device receives its
> interrupt pipe.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
(...)
> +       while (*int_status) {
> +               int irq =3D __ffs(*int_status);
> +
> +               if (*int_status & (1 << irq))
> +                       generic_handle_irq_safe(irq_find_mapping(nct6694-=
>domain, irq));
> +
> +               *int_status &=3D ~(1 << irq);

What about doing what you do in the GPIO driver and
#include <linux/bits.h>

And search and replace "(1 << irq)" with BIT(irq)?

PS the main reason we do this is because

int a =3D (1 << 31);

becomes a negative number on 32bit machines, and
can lead to confusing side effects. BIT() always work
on unsigned.

Yours,
Linus Walleij

