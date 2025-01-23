Return-Path: <linux-watchdog+bounces-2747-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDF0A1A1A8
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jan 2025 11:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F08F4160FAE
	for <lists+linux-watchdog@lfdr.de>; Thu, 23 Jan 2025 10:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8AB1BC9FB;
	Thu, 23 Jan 2025 10:15:46 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6394E80034;
	Thu, 23 Jan 2025 10:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737627346; cv=none; b=mdCL7jq7J/dFZTHLg31jY6S9pKaJmhnAQN7QTrbA7TVLdqWQZg4gUEi7p2ul317TLgCwPZ/7vWSqdtPBkO5vZTsgJItbpb86PW0BYK3HdSD1KbXnpENysx7o3gezAppuZtyQ36dHax2wf72WZZECo/FEiBARrmFSJQQqh9m9i1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737627346; c=relaxed/simple;
	bh=LdEvxOG4M3xhyziRPDEdshXqYe9qDBdUuHYDXg0Gup4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s1+lSq4K9UXqcHMzAKMMmxWqcLkUTDg13jWKDifO8z063+AtVGpE3zkvxCqR0F5hvE6qrpuSPu6zPjDDOc4VVm923B2kwRRR9Ok6/69c7v8R9aOmTji9KVGMt53+3R8Em9e4JMrLk10iI3HNqSJbLIsq3JIXoa/ZscrUHYnnYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4afe1009960so199839137.0;
        Thu, 23 Jan 2025 02:15:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737627343; x=1738232143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p+KxmSb3ng/SgqlGHgo2Oo9yt38YcpGVh06tKkX2Y34=;
        b=oTbsdF498lyLlmieqWMjtMSSk3/xqyTPGN7G9hvA9Ynq7yDd90zawNJV5O2n7oK5a+
         jZSUplp6Gj9U+GpxczilH07T98bqBxliFD91krW1aL0yPA+V3YX5Fhp1QyB8hsip5lCR
         9Xi+Rsp53haLvZLcP+rzJFqdTfGj03zeV3UBz9wx5bJ/awThQzc1Jjdf5NzhX07ceDDs
         1Ut9Oo/miwCbk9NKZe7ti6whsTH/9nnG0GrRIChEF63sSeQLAwXh5JVkK40iKqKzOYuj
         u6oZbpzsyjLbgyYr0qQZPC0/z0vTWDOBP8g2+KWXLS99wTeOMkQGBqXf8crRQ+iSBb4j
         +wPw==
X-Forwarded-Encrypted: i=1; AJvYcCUMkRaOC+mJthUZZrGW3jr0C2HSNs4IhPDXri/OhRvqZ/Lboinf83s5/TfxtvOEfnc/My4md2YVWkV2eREXDMHZ2+E=@vger.kernel.org, AJvYcCVK4fClyLopcA0vc0uz9teIrfas6EUgK6EOArSCB844gI2wRwtW2nCLD45vv3YAIIVXtXk/SsSUR+H8@vger.kernel.org, AJvYcCW+7pxOAGZP45rSUB0qJo/1SCMjvgmJvZ/B3wRiNbKzauyvYQxD6Gsh9D5OieYfd1gUN7Rb6B8JwGYbdtF72KQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQk2EDONog30pOYY+5w1srutzgayCbRLYDabBQTHaKfoYsxkTM
	1YYX+sSB+Gf/XLUtZseit/u8gulNpDOb1yng9vm64FHm6iMtQufOcP5Cj1ND
X-Gm-Gg: ASbGncugzQ+9iuzwNLDRCEglJD3vY50Kv4pBVvBK1hd2GXQYHvYNFF79XETiV3rr71T
	zYyhbq3pW77Dm/y6iR7iPY7BXpkIJJBX3Q9YPwbc0unu1ovma+/OR4g24DFot3qcb2nGfwjZx/g
	9HbQG3wjDqICVzSIeIMhxjt08dgtihPse1t3u2JCMzQn+NN7z2K7YY5VRgC4ZiSkfKGHvTaEewe
	6KjfMOIv1WdGSEI6Be/Thq5AwObUhHHKBuQDcv0MRBdV5T743YaFiFcW/MVKiRpZV/Zu65iKwZM
	lHB9Q4RjLn0gDfwF5u0L373rg/zP7pySOzCBcT9IDH8=
X-Google-Smtp-Source: AGHT+IH596c/mFj1M3ZYeTg+9i9i2zt/oQHDNCSPK2dwom0D958IPoTbyYFe2KOp3I/1gCLADDQMKA==
X-Received: by 2002:a05:6102:6ca:b0:4b2:bcea:dce2 with SMTP id ada2fe7eead31-4b690bd1fcfmr21005354137.10.1737627342948;
        Thu, 23 Jan 2025 02:15:42 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8642ccaf42dsm3406218241.30.2025.01.23.02.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 02:15:42 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c15e283bfso147106241.2;
        Thu, 23 Jan 2025 02:15:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9yRhAc/hFpZZNThYikuqSmEtxpBQlYe1ZN+ddMQB/cm33CoZC+nRbqRScgQ9nHm2R2ro5XtpdzxOe@vger.kernel.org, AJvYcCVM//JXKgRKOfAlMgK0hdONB13wmO8YeM5SMBAIY3H+xHdFymG43W/c20n1zp1ryEXDfyYaw4lPt0/iIJGBsiIYwt4=@vger.kernel.org, AJvYcCWrRU7UkJBBwKGVke0cFW7gVm5yXMa++n8SeqWTAsD4tfcqLo7wYa6ey3RX2x90dgQg02uZpg+Xfhy2auyGbQ8=@vger.kernel.org
X-Received: by 2002:a05:6102:304a:b0:4b2:48af:bc84 with SMTP id
 ada2fe7eead31-4b690bbf595mr20469196137.7.1737627342101; Thu, 23 Jan 2025
 02:15:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250115103858.104709-1-biju.das.jz@bp.renesas.com> <20250115103858.104709-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250115103858.104709-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 11:15:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVwZ-YZjCpTgZBxepoVozy=0y-yERpv47+aNaP-opmtpA@mail.gmail.com>
X-Gm-Features: AWEUYZlotLYOyfGG5HoLXPjOGN00_IF1ZN0qxno-ciiGepYbCVMMKEerAm8pvIo
Message-ID: <CAMuHMdVwZ-YZjCpTgZBxepoVozy=0y-yERpv47+aNaP-opmtpA@mail.gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: watchdog: renesas,wdt: Document RZ/G3E support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 11:39=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
> Document the support for the watchdog IP available on RZ/G3E SoC. The
> watchdog IP available on RZ/G3E SoC is identical to the one found on
> RZ/V2H SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

