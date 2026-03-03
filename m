Return-Path: <linux-watchdog+bounces-5046-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +E5HCO3hpmlAYgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5046-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 14:28:13 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 212381F0364
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 14:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 151C9300D0F5
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2026 13:25:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F4A2423A9A;
	Tue,  3 Mar 2026 13:25:26 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412E5283FCF
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Mar 2026 13:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544326; cv=none; b=etBNcTy52k3zOgsvVM+ggKyUIzHYGFQthdTPYBMajX8W4gJMtncqXdwbVWA2KKEAd4lawcLq6OJZEB0ql2G9QRUJrew7Nq3ukupgPteph5E+nIHjdoQ8BEVQQUIKhx8o7HRlqzy+Mh8AhS3srHsGK60c9bco2Wzfmgj1HAtMoUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544326; c=relaxed/simple;
	bh=n2OmAIMl/gywcCrUj4d8zXzLma6xKUNcSmZ27Kjdqpw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OI3yGC8cjGvByk9/lytyz7t19i+HDsRBTsO6vqrkaD1h5W5kIMrwSuvJbmQEVBqi5qcageA4KAzGCc0vSU5Lt4c7NHR2xvpjtdlyeYuo/BaRkgvAR3LOC70FN5SXwF60WtIP3Sub73ubysm2fQ7ehuPhaiQ4Q60n2HOxiANFKns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7d556c1a79eso7574372a34.3
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Mar 2026 05:25:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544324; x=1773149124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=muQepyaITr1dI13pFJp+536u1zM3z0pO9iYDkPNsg4s=;
        b=AeCnKQ/WrQVfDoAVe7MffYZ2MSY/HZLBREUk6YUq2dMzE9jx2PXJMZhBH0lOdu3BoD
         J2lvoQP/daa+SQn73MI2oW+bFjrgJIYVYRiatcLQBBirrD2jGeWtojsab6uPUnJaWNdB
         z/Eulsuo6Wxd5EZpjnF2w4NSiLk7eKwrWY+eFUIsgFNFvfRV6OR1OxEcFNs1i7cUSSTr
         y8rH9BTcme8l5N2aM/cQyKRZ0NRfph8ljnIHe8T8K9zCJ4GhldZ7UebKoWa6/Ij2pnm5
         0Xxdo2QC92V2ouc5PXN2sIqe4LhlRja0L/GBKs6Nx1aO9nB9wgwljDbfpbPZKezG8HPT
         39ow==
X-Forwarded-Encrypted: i=1; AJvYcCUP9qJQuL0zyCj2gpv3CczMnK1yfP6L7WLvv6xtpxddem/3zi2V2uY6EdogR5jzDzthLkVmMWbwTYUT1xZBpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgM4CcWHB8g9lRmWMPbAJ1YGqRzSfopgbONo2zj1PRNoLp80i
	pHmuDpYLs4fQT/+x2tFijebjWwL0TDfBXpNNbSRX07BeFQ2mmUOcyXfZXsVRpW95
X-Gm-Gg: ATEYQzza83pfdILs7I9qnsSzx3bF16SoZApaTP3RFcZKLbt83kTZP+tkIOs50dhr2jm
	68FgYfOzErt9jRybf07ef1jhz3wmqaSp1vewBf1Q1/Ey7DM1D7JQl8OLvdfrkx+AjIww96cf9x4
	auSvTUS5tU88nIED3zuSR162PiyeWvPhCbEfAk57B7NJXPUGtYSOnfHvB3lPmO949KXrIGkaKol
	uq/EwcJeRsTc4f4yaSJH+s6GdkPfqPjyrX4DPfHIFgWufOFKRujNR9bn1SHgACKvqwWgBWsf3+J
	lEg6sqKMP7T/xE+hOwbw1xb/i9Usx1ikcyiV8AFASOJcnZgPb7caJUqn3LwUwUlXvkR26rk8zHu
	ZOUbejFpvKQvvzT0oOur4O5t24JcqbC4ehdgd/w/LzWwTBW4YT8z5dXd1BEgJ7vlPuZOtCXZzMC
	7WsLYuVU0URXIdmmAGoW/aVmQzWbV9KWKKAHdULPSR0OPYXP8UESe0MEHif95H
X-Received: by 2002:a05:6830:6586:b0:7bb:7a28:51ba with SMTP id 46e09a7af769-7d591bdc161mr9717830a34.26.1772544324146;
        Tue, 03 Mar 2026 05:25:24 -0800 (PST)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com. [209.85.160.45])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644edf0sm13220876a34.2.2026.03.03.05.25.23
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:25:23 -0800 (PST)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-414ffb4c0a0so698583fac.2
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Mar 2026 05:25:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX1CNwlkvSQgJF1zyJvKzFl0edZ7MiYhhKKq6jB+nsjQW0gwFY46wOTY2JffIcNzI4o9z8lwBrTuCb2C06mHQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5f5:487c:83d2 with SMTP id
 ada2fe7eead31-5ff325d53c9mr7807558137.38.1772543823941; Tue, 03 Mar 2026
 05:17:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com> <20260203124247.7320-2-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260203124247.7320-2-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:16:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtrAwAtqNPqwq5qKHo4SKQqFoGSE7qPnFRD4rbKkPfaA@mail.gmail.com>
X-Gm-Features: AaiRm52a94My3QCqI-CCMK4Bc8JSeFzJGy0yOXJPSReec93Wzsgcz5hw25V0nt0
Message-ID: <CAMuHMdXtrAwAtqNPqwq5qKHo4SKQqFoGSE7qPnFRD4rbKkPfaA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: renesas,r9a09g057-wdt:
 Rework example
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 212381F0364
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5046-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.633];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 at 13:43, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> When the bindings for the Renesas RZ/V2H(P) SoC were factored
> out IP WDT0 was selected for the example, however the HW user
> manual states that only IP WDT1 can be used by Linux.
>
> This commit is part of a series that removes WDT{0,2,3} support
> from the kernel, therefore the example from the bindings has
> lost its meaning.
>
> Update the example accordingly.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

