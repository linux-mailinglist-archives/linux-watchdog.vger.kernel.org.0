Return-Path: <linux-watchdog+bounces-4327-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6AEBBDF15
	for <lists+linux-watchdog@lfdr.de>; Mon, 06 Oct 2025 13:59:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB7343B95C5
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Oct 2025 11:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D86CC276024;
	Mon,  6 Oct 2025 11:59:02 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277841CAA6C
	for <linux-watchdog@vger.kernel.org>; Mon,  6 Oct 2025 11:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759751942; cv=none; b=Yll+MZXYsIHhMoKIWqs5u1E3ggkb4BOT4udKctmqdDwKEbrgutD5Dc+UUnAwCZQePb2yQJ4v2eSPyezLETJbZJEh+K3MhXQGKjTkR9M8P7yp5o+OXJ6WXJu5dT3QCaYjMjfiOENZTUROGokMCzInZPFWIQ0obCWuEfSt+oI8t18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759751942; c=relaxed/simple;
	bh=I5uC25b6no/Mhl16rMoemx2zfef6d8aMW4nTPRFe6XY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYKjxhFuWH4diNhPaMmkpG6zhY842TFepE0E72geYpAJdC4tyl4tRxUY4GL03RPk4VDxrzmMVW6Lfv9tS89uTeKMh1u2vpfCPkbvnDRY36VoWQZK0aA57MGg3GgtH13KBLaCL7IOAxjICi+AguJeihrA9HZAP3LAqg/9cmarpiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5522bd69e14so2848108e0c.1
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 04:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759751939; x=1760356739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpORwolC+qpTMCC12M1JZ1HTJyn7uuoBh2byX7KsERo=;
        b=k9b3/ODRqJbQGFGgf97fStzlvOH63+O4rn8UbT1IomBcRsQ3dmrYQVPpJS4mZwSQAU
         Ngm+bm59rtSaOImubpHwCme6YXeDKSHOT+z+iFRRXBEV3ctAcc+OKI6vX0/3cNlAY/XP
         uex8Dux3JjgC/dnbwQuDlV1a8wnG5JaUoCjBZDIV8RHhlVKolpuOO57ejt33geCzbxP/
         7r+snXnpFjh8B7IDMDTP4HhygPcOm7M/Na0JuxgEbl7jlVPzAiwNehlX6Qc/U8fdr7os
         IXM/vHl37WsWXLpL7qzl5nTgySN7OZ0Wl2SamAPs9+2nWXkoY5ycc1IoRwGQ6/p0up/E
         Q7yw==
X-Forwarded-Encrypted: i=1; AJvYcCUJNVoHFhJyFVpG7uZzYuKVUZTIowFeRlFelQ0+Wob6ViciLkHUkBDjyL1LxzyWGdvAaNcv3UeBeg1NMNF8bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9uemauxoe4/JRrU8T/XfuwQCorLNQqSI2vc0o1H9xHiuABAN6
	yAH64QZReI/RC/g6sz2h0U/TRzJrGIWoAtiezR6f7kQ4OR1H4+Tyngnytj3G2KQY
X-Gm-Gg: ASbGncsssx+dX+Zf0FztBS0HQ/PgrNiDGVhngcF+CQvHlcEPqhKPb1pNWjyoWpry6Od
	SLaHcX7InFkr4uf8tbEwUPPJ9oh1PXGxdXct+PvMmu5zGOSyBM45LeMnIheVqDaDZzUwPWSc4/l
	Cnlmv2uOjEVnIxDxCZZCbHsUS7pgvSmCaNBhUqNiH+QWqZZGeZtVcOQSRZ1oFOKqSob+6PT1/PF
	yy6uTv1Smpb+tF/5kM2mkqXJP/XQQ3Fd6/HboFMkVljwQ3tA3yW7FEgebTQWBENJ6igun0vPm8+
	dLobVwK3H9RIoxhwNISDh3kI/Cb0mWiEpTybq3lwISKA+GsAIVM7oEddyd9RPLHIOBxogYWMLRK
	EpmHQ5XcoACNBpS+YGQZqZdEFOc5xotdxr99haig+8bJIA1aq9cffOvOO8uD0b4UqLtDTgql18u
	MU8zhXV1TB2aksUzB762Y=
X-Google-Smtp-Source: AGHT+IEfxRXrR7WfMuJeqFiH1YD3BEdzjdaodDjO0xc8DpQ2MbQWd3siUfCUExsD5dVMV686SYEQiQ==
X-Received: by 2002:a05:6122:3c96:b0:54b:bea5:87ee with SMTP id 71dfb90a1353d-5524e90e764mr4152275e0c.7.1759751938909;
        Mon, 06 Oct 2025 04:58:58 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-552ea335f77sm1864156e0c.2.2025.10.06.04.58.58
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 04:58:58 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8e8163d94bbso3462650241.3
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Oct 2025 04:58:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVGvOn+eCsXTs2p0TTyTkohHAcFSac85PaT+otrfxM3e3OmltlMl7TeIn2RTr8jbrg9A/TJFII42iBzlY98vQ==@vger.kernel.org
X-Received: by 2002:a05:6102:291f:b0:5a2:668d:f20b with SMTP id
 ada2fe7eead31-5d41d0dd17bmr5163622137.16.1759751938259; Mon, 06 Oct 2025
 04:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250917185651.12428-1-wsa+renesas@sang-engineering.com> <20250917185651.12428-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250917185651.12428-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 13:58:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUoo1vm1oz8HfC4UVj3X7+e8N0_cNWPX0BJeQcYZ0eCTw@mail.gmail.com>
X-Gm-Features: AS18NWABWM_T7RTrVAKGX5mAsBLfBVSPuYOM2tFdhqiGNbYaoJRqZ-R_pXAbaSY
Message-ID: <CAMuHMdUoo1vm1oz8HfC4UVj3X7+e8N0_cNWPX0BJeQcYZ0eCTw@mail.gmail.com>
Subject: Re: [PATCH 2/2] watchdog: renesas_wwdt: add driver
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Wed, 17 Sept 2025 at 20:57, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This driver adds support for the Renesas Window Watchdog Timer (WWDT).
> Because it can only be setup once after boot and we cannot know if this
> already happened, it is mandated that the firmware configures the
> watchdog. Linux then adapts according to the given config.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

I didn't get to reviewing this driver yet, so here's just the initial comment
from scripts/checkpatch.pl:

> --- /dev/null
> +++ b/drivers/watchdog/renesas_wwdt.c

> +MODULE_DESCRIPTION("Renesas Window Watchdog (WWDT) Driver");
> +MODULE_LICENSE("GPL v2");

WARNING: Prefer "GPL" over "GPL v2" - see commit bf7fbeeae6db
("module: Cure the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity")


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

