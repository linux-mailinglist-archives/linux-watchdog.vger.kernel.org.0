Return-Path: <linux-watchdog+bounces-2976-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8D1A3D636
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2025 11:12:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35EC63B45E2
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2025 10:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A958E1F03DE;
	Thu, 20 Feb 2025 10:12:25 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B31E9B35;
	Thu, 20 Feb 2025 10:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046345; cv=none; b=l+HT65fCcr6OgzFE6PxWS5YVckgVOjAMqi4xGzjyrkkaT2O0564CLYMYGoLz7J38AvNBNLgCkAv0aJ7rNcVnCz33k4qgmIsjogmrtyWRKTVLlA92o/mDohXKw1lQJB0dMFmxD+XIPGMJfay3+HboM9pOzd9F40PEjHnF6z7VLaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046345; c=relaxed/simple;
	bh=nIi99FHDxzLdX0vKOH+URmw24gaSbRYE2N63qsAdWec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RHTMbiqaGykVsCurjrtviingIBn2blrSwxeewMRWpUnRfQKoVDY450jj9nLDYauIBYtXqG3KSfpI/pueGikfiZ8fPl6eSBTRGoZM52asgqcpo2GQihMlC07C1sDUq9PIlPv6TW6dXpf96+OxqUdDdRkPPMxPq6Ofx2Tey4PtuX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4be66604050so258743137.3;
        Thu, 20 Feb 2025 02:12:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046340; x=1740651140;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6g+DX3MC+/86jx2uJn9E9iTV8rLmFW1Dd5ipEZ0c9k=;
        b=WiyAZF8SXWEZx9TxlGP7S3YHQOexWC47npPa4Jj6hUeDLy44zmL+f90d5rZth2dSNY
         EC77SbZKR5EIlxq26Ex/sETzy1REWu4+IgWD3xvoMLgPgJv/v2G0BFK2ha8Mkq4sH5kb
         hC0qhDmvksRwXWKscLFERInIpqg37RyssVcrfLqoGRYxEubwyNr0MJVV7iaa1H/u/M+t
         lUomYmIc9aIX7ER12F0pcvPBbWzgn8broyMGmvy94nh72F7Zd+B+EQbLY3MxYMdM3A9w
         XFIzNCmzzLHLVLXuFS1QHp7NmX9djCiOvVnFeU63+KNW7MYCmpnfWzBmYUDZHxyvx6vu
         cveQ==
X-Forwarded-Encrypted: i=1; AJvYcCUP9td4dlpsk/GpXQOzbffq6zugjneSiaIsxtr/Wkm/giI4RPPhpQ652KatoQU+ms7boNQZ4XvMf71I95FOBzOJZGo=@vger.kernel.org, AJvYcCUR4w9WtYKc0WeGw5TQkK3Yq+rUSikp3urwIxRXhzzdoOlTvmRZ0l9O7JEEq11NDrymfcEiJvYRZ9+8@vger.kernel.org, AJvYcCV3pnYr3TmXul8k1L5/bJqxDz59el1zE6/hUFhCVi14d8NdjI1VsZmeGKz9N/1sb5R8QE1rWOSEhUq4LeFI+5M=@vger.kernel.org, AJvYcCVJEsMv7JyoCWu/RcdO5HaWMFlB7Id8WT6lGBNXkOfn1XP086nX7N9p3f0TVmoIdiFLb/okrQjfpEc55zdS@vger.kernel.org, AJvYcCWD3wp0U+3GeGgmLO45FmnJOPi1D87P95pmhXszMlCSgdIT5enXXFgBzioEj9jnCCZdj3Bw7WTo02gQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9tRcZQNE10TXxLDlm4CRNqBWDe7npQ9/zXkuIOY7DvDBd84VG
	RrsFf+v6sUa3qZTQPyde5rYOSsBzYHa1iHh8coQtORwXcp9NtjOVtaBeSBZ1
X-Gm-Gg: ASbGncuBqr8HMHJSJ0TrTz8STpPTYfQg8ZgPgJKU2S8lGsVCSn7u0UU40gJXrp3ZPyT
	OAn4eV5vQwd2AUv31HFTJOfrBCrRjSDuHSOPUrvfaWXW5o4UnINSWPSZfM9nwVJRrb3dOWuJH22
	zTbp0ZMWt0FXYq11nhIkW29n/pVn1clySmp+F7rGncMLbXPp8gArQ5Bjhoa6kAEibCfC/Pi/S8s
	notnFHKnckm1Ov0tW1l4ueQ6Z+/fIByiDiGd50+rR/0U5+XSOzCfZjQ3B9ZS433Aac4+FcjBdy9
	j3J9o1ZpD3CUxAC4tRmKnt/Oa0WumjzPKvZMb2wPOLJkZerDQyuorg==
X-Google-Smtp-Source: AGHT+IF2u6D62Vnl4M6IzxCv2Pe64IooAhgmygegDeTDAu6zr6P9EvaLevM8KSvRBx9Ih1qX2H0n4Q==
X-Received: by 2002:a05:6102:150f:b0:4bb:d962:61f with SMTP id ada2fe7eead31-4bd3fe55f27mr14511726137.24.1740046340627;
        Thu, 20 Feb 2025 02:12:20 -0800 (PST)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4bc13d53651sm3166586137.17.2025.02.20.02.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 02:12:19 -0800 (PST)
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4ba0eb3b0f9so259322137.0;
        Thu, 20 Feb 2025 02:12:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEgaPrUiRpLaAfJPcwu/vBYSpYLU07ARaxpr1lck7E/Tl0NsiAQcf44NywG+UhZ6Ut7UIZFb1oetF1@vger.kernel.org, AJvYcCX6nd+WMyUSpyylUazZWuEsae3BTsGIzjkvt0xdDXP3DH1SfPoY2W1ob9+feyuRF+nDm5udT+/B/OqJGmHt@vger.kernel.org, AJvYcCXO+rxtUuwyC466ArRn41WjagUuCyB+CXQWiiH38HWxYRUsHVn85CQJ4zhD48XvNxe2At3H0f9rxzP6@vger.kernel.org, AJvYcCXiVJ/9SwqMwT71mgRQcLzrjXUCTukNKN7JjiwPF0WN7hJCtNfVD7j5z463Yy3vYcyPEeH+ddqAX4rohXb4zu0W5bg=@vger.kernel.org, AJvYcCXnzDYPofC/BeoIsbJOLBp33qFt1qwv1y6hdg7ma85De8iZrqwVPQKBy+uBcnZPHbqp/xx0rfm443KlujXJDU8=@vger.kernel.org
X-Received: by 2002:a05:6102:150f:b0:4ba:95f1:cc83 with SMTP id
 ada2fe7eead31-4bd3fe0463fmr11960631137.16.1740046339391; Thu, 20 Feb 2025
 02:12:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250210184910.161780-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 11:12:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUZTpcuhOsK-VQ=cQHACU_OK13GpKrW9zontqtUzWpB1g@mail.gmail.com>
X-Gm-Features: AWEUYZl6-xC_bxNyu24YgYdf9ZH6bVOARQ4QLwAphkFO_eW2hGjwktxozR2jY1k
Message-ID: <CAMuHMdUZTpcuhOsK-VQ=cQHACU_OK13GpKrW9zontqtUzWpB1g@mail.gmail.com>
Subject: Re: [PATCH v4 0/9] Add support to configure CPG block for watchdog on
 RZ/V2H(P) and RZ/G3E SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 10 Feb 2025 at 19:49, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> This patch series adds SYSCON support to configure and retrieve boot
> status information from the CPG block for the RZ/V2H(P) and RZ/G3E SoCs.
> Summary of Changes,

Wasn't the plan to use a DT property under /chosen instead?
(Yes, I go to great lengths to avoid reviewing and accepting patches
 adding syscon compatible values anywhere ;-)

> v3->v4
> - Added support to configure CPG_ERRORRST_SEL2 register

Oh, I  guess that's the reason why you changed your mind.
I will reply to that patch...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

