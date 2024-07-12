Return-Path: <linux-watchdog+bounces-1371-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A72E92FF38
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 19:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA9CA1F23556
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Jul 2024 17:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD27E176ADB;
	Fri, 12 Jul 2024 17:10:27 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F431741ED;
	Fri, 12 Jul 2024 17:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720804227; cv=none; b=WkX/N8GHjCxgoIW/wZILxuDiqJsGPkZNCyZUcleOxhr1PRTEEGukXwHhbiS0qrvfXnxKJzQXvRUQ0avOIF/8ZT4jAd3P/OGm0zb+XUHDT0LIaHdfp8qd7h1ovM0UXhaoShbu6ttLWFwHSGXmTFMQaPbx+Z2Jnlj1A6phF40P5EU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720804227; c=relaxed/simple;
	bh=P/vj0tML+5sLhokNg//BJblNlTH8Oeuu7lKQm4cUE5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D0rdxQ5eFp/ivWj62X3DwI7Sy6aUpDmZq2xxDA1FPd+e1xclv1UXK4f1TiEZ/aYNUEqQIePqpWSiFYgE6GTTct3cP7GX1ST1hNqU1696KduTFH/TBJJZimwfbQ6ykaMHzVl9D+KKe/0DcCrQPupSXUjWDYJrXNjEpukfQvbHs9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6561850a7bcso21995497b3.3;
        Fri, 12 Jul 2024 10:10:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720804224; x=1721409024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vdymif93j3WT4mEDNRmiwZsKR34HhTzNWp4qIqS/+dY=;
        b=SxPD3cVbnj83SefefqmxovTfPmuP43q3ntbz4PwBZwSVfsp5+hmf01qmR8yF58MKZA
         ZPscituCejy2nM+qiYt8fUJqnDJ4M8fGNlTYM2S+oXcIoB1OxgiAXcJKvbC7DMhQ7hv2
         7yEzgf+qJB+JxdPq368vu9pDYj4S8a5tLEmANRqAVskap+w/hK/EjT76rEBxUb94u+kb
         MmMp8ngyAJUo9ujC+S+zFTFNsAZaHBXZqUhjjTfCrdFFwqrXHmlk6nLeNgotHi6wp2o5
         /kYrE1+CfyAIBpIFscpydHNK+wPtfruBPYFzZNu6L5Eazf+3njZHILOb0FXl9y4MIBqH
         KMXw==
X-Forwarded-Encrypted: i=1; AJvYcCWbSw9StlwKH9F3SnwDQ6t8pV04t1vWABhyYHnhn4s3vh6AX8LzTf7Vfg1ml4pQrEb76aACSOvPL0L2qdfpnCItJJRt9Pw/dONBL+liogzywXE+KSMAdTTPrHOvOhOVlszAhBDwcVa33AtRi4aSk9E4pdtplVkkQ7j5TDkr1PqBm0Ei6IPmhxwSB/YTxJtUUvn4tZNXTiFuXbyG1twT67jFY/kmEi9vYklhjV8=
X-Gm-Message-State: AOJu0Yx4VNFFWC7F1hPYxZNgL0t38vQNSl4ii5dyv2qeIpQKLq+KU9hJ
	nqJUUy/7CrBjb5BNbVq+ZsU1fRcV5ntTELyE8RG5Iy97QOdJtQYucUkAVq6g
X-Google-Smtp-Source: AGHT+IHbf1ZPWpkegIvxeEaUwk3tdCIsPvIM0Lan2AbRp1z8YEmauvQDap3uRs+T9+W+hsHPz4rJOw==
X-Received: by 2002:a0d:e616:0:b0:643:c2bf:c156 with SMTP id 00721157ae682-658eed628fbmr120677577b3.19.1720804223695;
        Fri, 12 Jul 2024 10:10:23 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e4f18f0csm15634707b3.58.2024.07.12.10.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 10:10:23 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6510c0c8e29so21731097b3.0;
        Fri, 12 Jul 2024 10:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXVNQLREwE8XbTI6KT0K8QI0ML84eUK6q+dAUhRupR0Thzp+ThOAilG3t0nc9wIxb2S6x84ofQBYKLEf3ENLZb5RVdm6B3oQrkZ1HEgnmeEO7qRz0Sa6M0IQ6SFyhBxuynj/596NGOwGcH6grOXNLnWzxeOuha8njb80LhE/ysw393W0rfacR/1v9j0OgiMr/OL5ZBSWj0toS80GOygagc9rWEciu7qqDBLLWk=
X-Received: by 2002:a0d:eec6:0:b0:646:fe8e:f03b with SMTP id
 00721157ae682-658ee791211mr114821107b3.2.1720804223028; Fri, 12 Jul 2024
 10:10:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531065723.1085423-1-claudiu.beznea.uj@bp.renesas.com> <7f99cb63-0c6b-460e-934b-4e7e8d84bb3a@tuxon.dev>
In-Reply-To: <7f99cb63-0c6b-460e-934b-4e7e8d84bb3a@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 19:10:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXN7xCtjRraTu=3JS6x8GCo7iuS40PVTN_DPvhA-AMqfw@mail.gmail.com>
Message-ID: <CAMuHMdXN7xCtjRraTu=3JS6x8GCo7iuS40PVTN_DPvhA-AMqfw@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] watchdog: rzg2l_wdt: Add support for RZ/G3S
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	geert+renesas@glider.be, magnus.damm@gmail.com, biju.das.jz@bp.renesas.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	claudiu.beznea.uj@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Claudiu,

On Fri, Jul 12, 2024 at 5:39=E2=80=AFPM claudiu beznea <claudiu.beznea@tuxo=
n.dev> wrote:
> Can you please let me know if there is anything you would like me to
> address for this series?

Your series was merged in watchdog/master two days ago, and is part
of next-20240711 and later.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

