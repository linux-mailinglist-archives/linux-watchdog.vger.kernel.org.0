Return-Path: <linux-watchdog+bounces-4353-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C5EBC43D1
	for <lists+linux-watchdog@lfdr.de>; Wed, 08 Oct 2025 12:04:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46D823AEBDF
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Oct 2025 10:04:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A4F2580F3;
	Wed,  8 Oct 2025 10:04:27 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95C5221FBB
	for <linux-watchdog@vger.kernel.org>; Wed,  8 Oct 2025 10:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917867; cv=none; b=qr/LJw9uYIPUPGo6PAWcN+M4GoqiDgp/mqGDUbpZZ5hRmKJmtLFg7Ri/ECxnazUnlJdJItSBM7ldTePSt6mFOs5CItY0ENdUiP1iUSAgcg7XyGQHldUqbuwi369Wu4TCvY2BnVBHKxlbGEbim83/q5WXpOlFC4XBn0wq7Z5MMoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917867; c=relaxed/simple;
	bh=Pys5RX0y7I/eZwC5olc+dAVDGLe+5tU+vJUD3pxdTi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWxq6u7sUJvat/4nqrg1jWOhDMvEQxcymhoNUUNAWn1wFw/67mMTOpHnY0C5GC5+h2tzOgdJFh+WI9mBKw5E2bkN40YScCBO5MCXfTuX3tVDYs7IeYyhfInHag0cpd7rqWvYMhIOKJO4d3VzeyhchJS0luIPsA0gH1aIAiGwZag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-556f7e21432so5873740137.2
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 03:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917864; x=1760522664;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ieF93s43yzJZCogiWT8EWDvW3aNVlQXB3xmuuiyuM8k=;
        b=ElG01Fxf1bxrdT7H5+2XHchxzPLCkvo2LIz3cV7ZC4/l9WANxehyxY0dgp/mhn0Zpc
         fjaEjE2usS2fWBiX6B5jDVqicIJ66sC6S1rZ1LMqGXGb2jjvdDAGV2nlnkUsk8sIAxDF
         W8XoRNhVGLdBDJH/6VnpsAV9NJk6UY03nZtjYCPdPRTgTrvMdadbdUKlPiu/I9suLR4W
         OpBWg9vIySSD5iOOfDRqQF/ZTck5OU4CjdgfRN9IQoyGkBAgMt9VMn8pEa+zJ4dt7v7M
         39Eqtjqyu1LZZRQ8BFVDnGaQ+VxQU4Gd9V7ckCe9kSVnjySBvjHCRfVfCDBfS8t7e8wb
         zr9w==
X-Forwarded-Encrypted: i=1; AJvYcCX0h1EQComBZ492G7H4Rp35WB5qTWQ7T4RqzR1nMtraorc4P1ZowilYS1iIhAxNizkYnC7dM+QmTrPTeRHOzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNQkXalmdrV91RQNO7wARDrkBMoxG3jVKXq4BMYipxynIx+c0D
	Ou1oOHSRlrY5JurNMjCVaDKJgpVP32RNXN+iEgqzeUnsFxy/t6mTxKx/RsijCFjr
X-Gm-Gg: ASbGncs7tfZtO70e6i4SAKC3eZORJIjxGDlq+/OSY4mjhDEOrnH76Pba7uXnXvKOXDp
	qQwQKam4Tp5dwKrBBEXufomo3Q89BNpxOzniqj351odS45Na4zNdznugl3limlG1pF9gQYBQL1I
	NzSdtMsFouMu4S0fJJ6AFw83c245Qa5Eg3hzOkaENBBuhoDAoAo/JKmzIC51aO3Pg3zV7lWm5hN
	+6Lax3v1F6O18+X/czzZ1111r1SLLBjPZMxTYTXKSz01XIZV+GjW5F1wgj7Pll/l1/Wm7rGxPEp
	H5tGyLXACzrn+xRfCTrt4lLv14RtQOe55SKpuTP+rWkG5U5K+ZKMZk5NMuePmFwJQ3QJKMUf8LH
	342HilSChsbAu2MRJvPHlxXPo2UOGT1ACcJZVgvTlbfIFika2+qGgIBDYXK0WNsNRHHnVh0Hns3
	+5Nd75B/fCJrGPAILKJre8LPdBqec8Lw==
X-Google-Smtp-Source: AGHT+IEwCbEl037jBdP5lQ//NSII3FkFjsohH+HRabLmiPeaZ8XtZ2Ll9gaNv693OPSUlvgY2kS39w==
X-Received: by 2002:a05:6102:2929:b0:59c:e912:96c2 with SMTP id ada2fe7eead31-5d5e23a4e9emr1046968137.35.1759917864190;
        Wed, 08 Oct 2025 03:04:24 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d39aed4asm1461786137.9.2025.10.08.03.04.23
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:04:23 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-8e2e9192a0aso3665515241.3
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 03:04:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXuGZuTjkNUe+x+Net2aUuvskDoTBP1QvpxRlwJeu7KPjwhQf6dw4AshW776lbtPQXURZ13V0OF6j3GdF8sBw==@vger.kernel.org
X-Received: by 2002:a05:6102:304d:b0:519:f3b6:a1ae with SMTP id
 ada2fe7eead31-5d5e2322d22mr1062500137.22.1759917863777; Wed, 08 Oct 2025
 03:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com> <20251007152007.14508-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 12:04:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXokiKb6-mii8yKO5XY=WSDtoMsRmzYos+My-6fKZMM3Q@mail.gmail.com>
X-Gm-Features: AS18NWBoSyztjseC5S_f1PtB13ycGpgmlyzACUqpDmkv3PExchVdnWXjGtN11vE
Message-ID: <CAMuHMdXokiKb6-mii8yKO5XY=WSDtoMsRmzYos+My-6fKZMM3Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] dt-bindings: watchdog: factor out RZ/A watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 17:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the RZ/A
> watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

