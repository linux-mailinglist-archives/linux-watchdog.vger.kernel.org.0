Return-Path: <linux-watchdog+bounces-4354-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E62AFBC4493
	for <lists+linux-watchdog@lfdr.de>; Wed, 08 Oct 2025 12:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9311C342F28
	for <lists+linux-watchdog@lfdr.de>; Wed,  8 Oct 2025 10:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C33F2F1FC1;
	Wed,  8 Oct 2025 10:19:21 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B982F1FC3
	for <linux-watchdog@vger.kernel.org>; Wed,  8 Oct 2025 10:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759918761; cv=none; b=YiOzJOZXnYEs/jhPQrIIBT+OmpcFSkIBG7EpmhVXNfymZc6I9V38grkUcBMaPleyiHagP7TxfCFqMiewLjdrExMQvSh5ZiTzUHr9GTiQjm3ztpYRAtNxz0E6Obi5rAeA0vCAPEhEzHVMEhLUkV2KgsXtEMa4RDM4yEPJXZ1wNIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759918761; c=relaxed/simple;
	bh=41JLkiaspv8I62corOwXybyoBLD22yrEUZJLxiyHEno=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CG/KIV6Tjlzgb2dmFNK+tb09Q1IQKTGsU9TdPmBz15tqliQeOlqN5cZUyvvdtwP4X+YDCVw4PJYJGBI2fuaCK7oVWnuDHURnGBKZfZXQspBe3z8/ioKHxneI98LSqQfwOswbejvvpq8flTfjg68K6aF6Ia9gH5cvueCmVe4NzGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-551b9d94603so2598373e0c.1
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 03:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759918758; x=1760523558;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcfRAkL12GvEO5UonVdhJvoy1IYd4LHwp69l76UKLtg=;
        b=Bgb/xWigG4Bzo4DcxJ5Jx9mwU1LangU2HfT9yGxCfW8FoWoZBajhM2j5XKXCJn2gCq
         Iad2XSQDIR9jrJodCili4XvSxsmIxoGRbIUY6zSHdlBUU6pqEaWcIrGSnoTwETA3qXN5
         AoN+tlXdB+gNve8aIATBuog6/oUa1aKyGihjylPaq5rW1SkhXybKTmRChcHhDp4litca
         6TR2FKEEEcqE/BtsM82Pvw5QBuu3VA6SsE8oOjv0afJllQx1gUoJni65i+QxLJKBrSVa
         8Zi6Sat6D29blqAaaoB/dRlD+kZNDohTul1+KiUgV8KbVJ3gN+loOqDGfzwEATCu/H5o
         LX6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU516clhztQpPPF98XDskLNjNhx/tPMwt5T6DDXvslIuOOfhGJnKd+U1SFN0pUorM5DYzycwIdXM+KL8gK+Qw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe19uLlbzoHmfx0kkWmCnyVZ0AcasR7VV4Xe7gNygYK0Zr66hT
	3namM69oTOkOh4r2jf5bE1/nDRNpR1uPPy8hpSjhZeg1ERMBOwzskLp2O/yVt3pG
X-Gm-Gg: ASbGncvzBuYpsLfiM0eZRBlP/umTiRvV+wPNH1CXY0D+O9jgkZ03ujjO9mA57/S8SbW
	0IG9ObwFE+pe+siReyrAkccgchj8IP+5UN+4uXpYNZfTemvt+FvNWf4X3Agtzc/wpD5fBaDPAz6
	UG5upEcYhaXwz5Vk030Uxp2XyTP4tSsyCa7+9wuq8uYTaizo+Wt/c7JQATjQOAbPTFcsABC51WC
	sUPZMb38XG6uQKhzj4zOehGOsRCW9sJNGHcw9xiHiiSNob/t4BNWEMdDdCKUcF3DJFWooqSOuj9
	JV6Zpia56cO1QfJHglGkaw1zux3DPLGYA1oTP1QjaS4lkSMPB8NKvxVVpz+IZIf2COLxzwHWONn
	OZKK/e4Zkw+4mEIpoRpdsM9xr0+L7ECfiGGDslN0m5UylP+pFRNMbcBQ9FzbQgqnfb69HSR3xrO
	DaLUj93tkPRt/6IhN7qxI=
X-Google-Smtp-Source: AGHT+IEPt41Kj9cQytpUopsREuyLJ8p19eI6udmVKGm1XOKPLlRdcfbQdlMb8+zR9G3+9bYfINs3dA==
X-Received: by 2002:a05:6122:d11:b0:544:9a46:7c85 with SMTP id 71dfb90a1353d-554b8b431fcmr1014619e0c.4.1759918758537;
        Wed, 08 Oct 2025 03:19:18 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf3e0fcsm4392459e0c.17.2025.10.08.03.19.17
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:19:17 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-89018e97232so1712153241.0
        for <linux-watchdog@vger.kernel.org>; Wed, 08 Oct 2025 03:19:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGMTidXy0bbbM/0Zlnc+TYij4nXiLV4ZI6fgx2HftEnFKVs4Q5z61jBGy6qkSx/farOMYfZJtSQO3khG93sQ==@vger.kernel.org
X-Received: by 2002:a05:6102:2925:b0:520:4054:6b9 with SMTP id
 ada2fe7eead31-5d5e226f3e6mr838361137.9.1759918756906; Wed, 08 Oct 2025
 03:19:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251007152007.14508-7-wsa+renesas@sang-engineering.com> <20251007152007.14508-9-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251007152007.14508-9-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Oct 2025 12:19:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXdMK30hQrOR8CsK4Y-5ay1T3GUtSFiunnfGNVO4vDwrw@mail.gmail.com>
X-Gm-Features: AS18NWDAuwWmqJU4uirFV040dMIpRx_qEpSrWPNxsSBV2umiQVZCcO8iQyDM_X8
Message-ID: <CAMuHMdXdMK30hQrOR8CsK4Y-5ay1T3GUtSFiunnfGNVO4vDwrw@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: watchdog: factor out RZ/N1 watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Tue, 7 Oct 2025 at 17:20, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the RZ/N1
> watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml

RZ/N1 does not support "timeout-sec", right?  As this detail was not
expressed before, you may want to mention that in the patch description.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

