Return-Path: <linux-watchdog+bounces-5048-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCNUN5XkpmnGYwAAu9opvQ
	(envelope-from <linux-watchdog+bounces-5048-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 14:39:33 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 549791F06B3
	for <lists+linux-watchdog@lfdr.de>; Tue, 03 Mar 2026 14:39:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA8EC30E1B40
	for <lists+linux-watchdog@lfdr.de>; Tue,  3 Mar 2026 13:30:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F01922F767;
	Tue,  3 Mar 2026 13:30:14 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3583F1C860A
	for <linux-watchdog@vger.kernel.org>; Tue,  3 Mar 2026 13:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772544614; cv=none; b=FPqZ+TmA/6UTxMETJQtbJfNobf8GP5+9PBIjBPKld42USLI5A+S4U8jVC2di/nijisJn5TAdMjeDssyEmPgoCApp014hrGAPr7a2h9a3fzWFd+PnuUuaASh+CWjl7757vfbFMESmKayORM+Yvqpz666wEHdJRti4QkjbqB0eqdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772544614; c=relaxed/simple;
	bh=237yIWVIGSqP8Nr5OxXm6vlm1rkrjBql5SlE9/8gnlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cDQLRrGIKETJrDO0d462gbw9D2RXJOG0NXAeZKlnLxldGzJNqqCbG7tZIjCD8bYmVvQ3CVbgdLx+400/IMe7B/sPJhdOU9HjKz/fZTjqQVu09RxwWUfYbo/K60OM2MBXwiCc7XmWa/74L6EGDbI9xkKQoABF15US36mzSjXgVII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94dcf70af41so1269916241.1
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Mar 2026 05:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772544612; x=1773149412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAwQLMiHJNmA+WgXHi1U8N28xuUzy6H6o/lizldAOqQ=;
        b=wBmCXNI6S5kg/yd8V3duJKzBG8AEsggXRbASMoeCLBkMARIf486fKoNqNxmNN/GhQT
         htFA/NbNclwKB/4yz8+HP5VorVKoLhEKpAUFZJR7vCU1s5Nhw1jDwgrAtWqTCn93BDPB
         Ymzhn2ZKq06nAA2gVk4Nbi6M8qMNqYvd46+ob3JAG76UfEuzreU9c0HzIw8YglFf1IYm
         YKDhZ8/Zb0LbZOK46M/CLqK64s+an+zWgppYoo9TwPoa8qEHabGTaju9bObK6Bd3ir1o
         VzqSwE993WPDM24K8L+pTIQC+3O1M8SQao1TC67TOghvMqXHT1ShWZer8/ORWtDqZwkR
         r6MA==
X-Forwarded-Encrypted: i=1; AJvYcCX8g2Acrs4zVo3ue3lD6/d0haEubSCOnBHivkKu/nYCpiCD713ORVE/wheWcrR4k9IiiYhegvNrUjPeWqGbUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQtDAtDnPeHe/vJSWmmETiY+zXB0mcToV8i/TV5TLvj8ZZqwbm
	1Rz1gqV7HZg0MAcn1nP4KQRljh7Xcq6i7e+ZOPkL/YOr9JIznS/0UmGY9JZYgM3t
X-Gm-Gg: ATEYQzxX2gY2TUMIrXVpTp9UCRQeYiX1VKKE+UcZyBgtuW/t5+9/m6FPWyzmibS2ImP
	w/jARZT4BSOovcOKTu5gFeCJme55u/ik4BW36UujyPy06mtcaRFru15RgYFak92C/QZhwSDSzmm
	FFVU0HOMbggxL3+FtABqgWZznGR3UGgNvhERVTNjIOD02VuPKgX0jbxpkvlQf/t7iXq7yXSMaeu
	n3MB9RvHMDmIMSY5jeQ6rXNv/x8JEZ7oxwtk739MYF7MoaVJwaqcrzSCJ/RBwXjYqr3jpWBg4/4
	1gYY+9sUgBOeXXG0wBBzluHqpE/6aeTFoOhdB8985AzIDCscEXeLIFbVbFF4BTzBNiJ3zKpXesb
	/6NzTtDVzF/DSodwGpBdaAq+p2r65Gj5ZohdwjJo6F/77cs2Fwu1t5ve1C+aAdHIRyQlLbtvAzt
	3XBFM7y5NspQPRNdZDtsmhf1vkUCwEk/du6WUm9kY9WE8RF9blUD5MyWoSphnc
X-Received: by 2002:a05:6102:c4e:b0:5f5:7737:cdf9 with SMTP id ada2fe7eead31-5ff322c2715mr5059857137.1.1772544611861;
        Tue, 03 Mar 2026 05:30:11 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df61672ddsm15139305241.0.2026.03.03.05.30.09
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 05:30:10 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-5feeddacbacso1200688137.3
        for <linux-watchdog@vger.kernel.org>; Tue, 03 Mar 2026 05:30:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUYSZDKYu8WplOc78djFLbFv5LEz8nXydMt1efI1/yM146W9RcID4I8mj+N1PnSr8eRhRYA3pfdaiaMAbnVw==@vger.kernel.org
X-Received: by 2002:a05:6102:c47:b0:5ec:daec:580e with SMTP id
 ada2fe7eead31-5ff325a1577mr6210023137.36.1772544609268; Tue, 03 Mar 2026
 05:30:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203124247.7320-1-fabrizio.castro.jz@renesas.com> <20260203124247.7320-4-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20260203124247.7320-4-fabrizio.castro.jz@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 14:29:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX+X77ydYhvGJUmXqBWE+mOsJA3n+drz-9DOYopUFAW-g@mail.gmail.com>
X-Gm-Features: AaiRm5008H6GA2iSW5UrwIeeY5Wgcg_c3Mk5GG-msQ01mr1Ry27aQjZHaY7c6iY
Message-ID: <CAMuHMdX+X77ydYhvGJUmXqBWE+mOsJA3n+drz-9DOYopUFAW-g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: renesas: r9a09g057: Remove entries for WDT{0,2,3}
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
X-Rspamd-Queue-Id: 549791F06B3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,roeck-us.net,baylibre.com,linux-watchdog.org,gmail.com,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5048-lists,linux-watchdog=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.651];
	TAGGED_RCPT(0.00)[linux-watchdog,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Fabrizio,

On Tue, 3 Feb 2026 at 13:43, Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The HW user manual for the Renesas RZ/V2H(P) SoC specifies
> that only the WDT1 IP is supposed to be used by Linux,
> while the WDT{0,2,3} IPs are supposed to be used by the CM33
> and CR8 cores.
>
> Remove the clock and reset entries for WDT{0,2,3} to prevent
> interfering with the CM33 and CR8 cores.
>
> This change is harmless as only WDT1 is used by Linux, there
> are no users for the WDT{0,2,3} cores.
>
> Fixes: 3aeccbe08171 ("clk: renesas: r9a09g057: Add clock and reset entries for GTM/RIIC/SDHI/WDT")
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-fixes for v7.0.

Apparently the same applies to RZ/V2N.  Shall I just apply this patch
to drivers/clk/renesas/r9a09g056-cpg.c, too, with the SoC name
and part number updated, and

    Fixes: e018f9f8973760fa ("clk: renesas: r9a09g056: Add clock and
reset entries for WDT controllers")

?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

