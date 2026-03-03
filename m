Return-Path: <linux-watchdog+bounces-5047-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMj6MqXipmnpYgAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5047-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 14:31:17 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6861F0466
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 14:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F33D3304611F
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2026 13:29:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020FF48CFC;
	Tue,  3 Mar 2026 13:28:45 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF09B1E230E
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Mar 2026 13:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544524; cv=none; b=nfPS6I5j+k8jjQ+mkQ2qjnQ6rP+qFn4RtbeIghKaNOgx1O/2xMgRiEFJenzhM4AtLwALJrAnp+Js+WZtyxeYwt7JdI5yQ+mHU70tyVPMy9YqLag++senUT4vL93eyMmdb72gUl0Mt1nHUMmeerOCD19BCCBGtjVoOukM89372cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544524; c=relaxed/simple;
	bh=0Mx80CC1QWM3bvGMYo64nUaV/drH9YWwIQYt8dBOlnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBJYNAvQE5Kh+XImdTX4iSgZ1OocC42U7D2u6ooGVXg+iEBBLvlkzPLBY00k09c+AA39Ceve6jBhPC5Vkq4hh2W2oyA7K6iB2wxcXnNybxEYSCB2hZbkI5+2t30WKURcvwV7F6BxK4ipXaYJNS44inlU/g87UsJoCbh8k/03NmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56a857578a8so1883687e0c.3
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Mar 2026 05:28:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544523; x=1773149323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDxJiIrxQC92hbeNlNOe8Nj98YN/DDHhyxVEaLyss1E=;
        b=knlxALBoyXmPM4I4asSQysZuU6o8Go3eFA2n1RuZEh5vSX7vLAhlmfav++yxDAHavc
         LT6tQcww6ROTt3fXSgRtm8ZdbWjUx/HopxGGDoRqNWIsquMHu0enP9BMEd6Lj4KEC9eK
         AMa3CQ6+qzGj/XUX12A4fnV2UtyvQb2nyNGFGKZQgMRfmFIrHEoVEBpBcPIaMjA3EcyS
         i/I6gvdgVb3wk7IwAnzpUsLliRj8bgORS9wa2oCNXgrh9blOPPvhXVrVPVCLbHWbJHNq
         zRh/UjgzetyBleCsLksWomk50dln2eHMaHD8tBXgGggQles1EujfZZ+8IE2O6cmn5gCm
         JXlg==
X-Forwarded-Encrypted: i=1; AJvYcCX6vU3BvrF9uzvVT0+oOYRCdCc0tpG1XDX/Bm08YToMhZ7Mjt6bYPv7kdHMnFJebllw0KhjLLw2mk9NO2sIGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiNRMWr2nBSTPs7brX/2bGbe8XtuBToUoYw9KS9cQD8lSRH7+I
	Ho+qsADv/g5xHhi5kbrno8RbmLjv9jOnoiND6dq6DFFtuP0JEpKBjetgHBITh4ux
X-Gm-Gg: ATEYQzxx0H6tnXeMDKPxB98Vc4kcutf7PsTRr6zaRVD2NlHPH6PnuRLHYYmEl1rwMgS
	+V184vmrkCtK27adBnduoGlbaK+Uq7nVH4aLh7bpMA1/t975uNJIIKHk9cNouMsvNgSMgxs55z9
	GW6nAB6Sdl49dGMtELEyYzul+/tohZm4cRYnblNM9MxhR1U+/JExfCpFS1mps40vwqcV6BGCf5s
	avwJYtdb4kXJHTsU93A1GDVT41aI+MTZnfbYIIRRuH/Y6MvF2x6wv9OvJVAw13Q5p7eQkfkrgTf
	4G4BW//c3eYYPoesxEjgPyT5lwUGz0nVziX5VIeh2sbrKqdm4dvwC+OFNbE275ULV5SGvpJb17g
	5ipPKbUlECUcIXIBwELOXr9UNtOyup1WWZdworGbNAG/z43yR4tC576i8sx2JzAcvH3g5P4eoGX
	+lOL+dS0wNMPLFXSIciysNkH7Ev6ec4SWT51+YdSEyWeCrJNbqe+Y+wEUJQP2q
X-Received: by 2002:a05:6122:340d:b0:559:6723:628c with SMTP id 71dfb90a1353d-56aa0aa14c1mr6805602e0c.16.1772544522693;
        Tue, 03 Mar 2026 05:28:42 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df6417a98sm15504043241.4.2026.03.03.05.28.41
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:28:41 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-94dd01deb53so1276459241.0
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Mar 2026 05:28:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVokOoRZONbFzUtPxGNuTCjuwH+QZTPAqhC98yRWcQt5MPcfplRz1fLtR8M7+pgKwpQ1uk1ozUn4TfkM1unXg==@vger.kernel.org
X-Received: by 2002:a05:6102:f0a:b0:5fd:f14d:4cd6 with SMTP id
 ada2fe7eead31-5ff3254b2bdmr6188901137.27.1772544521227; Tue, 03 Mar 2026
 05:28:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com> <20260203124247.7320-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260203124247.7320-3-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:28:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW9F48wTrhJRM-w_+4deEzJxOkGR6WttLmTmMy9DT1Dtw@mail.gmail.com>
X-Gm-Features: AaiRm53fCUjLUZ6px0BRfJJuPYdPSrAIEkOdRkY6q1dq85dF6GGqE9pEydHG_cc
Message-ID: <CAMuHMdW9F48wTrhJRM-w_+4deEzJxOkGR6WttLmTmMy9DT1Dtw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r9a09g057: Remove wdt{0,2,3} nodes
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 6F6861F0466
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,glider.be,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5047-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.662];
	TAGGED_RCPT(0.00)[linux-watchdog,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,glider.be:email,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Action: no action

Hi Fabrizio,

On Tue, 3 Feb 2026 at 13:43, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The HW user manual for the Renesas RZ/V2H(P) SoC (a.k.a r9a09g057)
> states that only WDT1 is supposed to be accessed by the CA55 cores.
> WDT0 is supposed to be used by the CM33 core, WDT2 is supposed
> to be used by the CR8 core 0, and WDT3 is supposed to be used
> by the CR8 core 1.
>
> Remove wdt{0,2,3} from the SoC specific device tree to make it
> compliant with the specification from the HW manual.
>
> This change is harmless as there are currently no users of the
> wdt{0,2,3} device tree nodes, only the wdt1 node is actually used.
>
> Fixes: 095105496e7d ("arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.0.

Apparently the same applies to RZ/V2N.  Shall I just apply this patch
to arch/arm64/boot/dts/renesas/r9a09g056.dtsi, too, with the SoC name
and part numbers updated, and

    Fixes: 7db958983c8dd14d ("arm64: dts: renesas: r9a09g056: Add
WDT0-WDT3 nodes")

?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

