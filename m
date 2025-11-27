Return-Path: <linux-watchdog+bounces-4642-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEEBC8F75B
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Nov 2025 17:11:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29D403AC5BB
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Nov 2025 16:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36AC43376B8;
	Thu, 27 Nov 2025 16:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mT2IJR3f"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3016D313266
	for <linux-watchdog@vger.kernel.org>; Thu, 27 Nov 2025 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259873; cv=none; b=PAMlBw1Y45KO/a8nVbMrCj9IX2Pj58VV2oYVXE2KjT1BEvOT1KMiN6YC3mO1Mmn+2NfZ7k8f6wbiApbTc2wkh/ZD1ZMPNc5tc4zZVDJSf8iMM25pqO8YSN5XKPXeMwr1wtyJm0iOxieXQXILtRlhG7yTcmW2lhDizW4JhbCDpM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259873; c=relaxed/simple;
	bh=ladk689p2Y8k00NfW5QpkMPZIgCI9BT8rEOH8gBzA7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ekrgIUy2Sb+Jxb4rQaWHWWFjjG/CBuNwnNOojyJoR1Wu3PrdOLYpYDbiXzqnJvapodHisdrbW3l2cYZAPodRUSsuCHLG6750x/wOhmWmJvz5/dJWoWCUomShT8X6Tj1f7NwJLVqCgiXl+GIq1GehesyHLbrheLrP1AbS4YRq5I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mT2IJR3f; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b7355f6ef12so203423966b.3
        for <linux-watchdog@vger.kernel.org>; Thu, 27 Nov 2025 08:11:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764259869; x=1764864669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GfueEmXvJ4IoIPwxPQsIfZjF3SvSPLgK00r7p6jbi1Y=;
        b=mT2IJR3fd/M+eM2FoiS697WpBi/Y7alBWOHDWlZrU/3ow6g/Qr+q4dtUunnhHWEPuY
         EdTcGqzPfooqOP3wi4x4bduNirq5iubQ8XpyeXSFYMjTS+R46C4R1+l/ffY/gs3yzXwV
         GMEULkBncAvguu3axAitJcLlW8RqqQT4gp0ITZQxhePGfcs94zOrmhTCBb4vCpOozwAP
         F38rbW+Q+LqvIlE+UC/OBO0jkx38oryEIvR5SwoX7tXGmow1WbfWON1EglJQviPBLuX1
         UbCgaxjt4lxAjO5Opdgzaoa+440t3k9GCwu6YujEauVCRlsF+9PesHs2ospqqdVZKEE8
         K5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259869; x=1764864669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GfueEmXvJ4IoIPwxPQsIfZjF3SvSPLgK00r7p6jbi1Y=;
        b=ebDf/quEKXGWVrwCfElYYN1Q4+dJThGetn9yC8MZ7d4LOn9z2ONg4ZQVwefSin3i93
         IRnKEWbwFb0A0+SLdUiF/rR3H0+pBLj19svTq3SExQHS8eAN2QVO7cfEHC/xUWsuU8Go
         BhiLvqcAnLRHvq3Zh7ICLpfMgVqYiSRyVwvXpqVsmFQJ7ZVGrqaV6buPx3F/VAy/zrsj
         x8/K02OOYDLtDSy9iNomlgHJhVb2YX+ZfrzcvjTTYzkZLF2hMKOLaF98gq8MSVusWTIc
         eyEnm/GF1CeMmVPzDKpSMWhud7gb2pZ79cBI2ImfsEBR1vH19QPMjZpXe6EaC62CMxXR
         tYbA==
X-Forwarded-Encrypted: i=1; AJvYcCU/eecRCMymPVOFw6BKVXqkg+9crqZxwUPiKT8AuXhwOjUO5uS3/oywnQiamEU850sTKHLUAOKfxSRr/SiiUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7S/OD49Zn2IRPxbpy2TckO6IvwqCWJCEKesBn+M/R5NNffYAL
	MgBSB6yZTDGtXURhFmeEytLba9aBSFcRHjIUPtCDXHOZPZ7qy3egk95Z3vL5QvoQ5oWdPWEHzNn
	a9OCefaEP283ulbihZba6iny6Lz6GNUg=
X-Gm-Gg: ASbGncssW0n407e1OtFQCGdGYV85OoSJ/VCEHZFIZuMC/5djq4A+ENegjdYFoKw2bXF
	WynbJ4KAYyE4PtKS9iBQ3xc8hz7of+Sn0xH0yYU4evTMezFB1E7GIKlMCpR0yhdHmqamEKZTltj
	DNZUzLg/flRs3lhXENuc9p71A5Nk/4S7rKbPjTDZxUy8R6B5UH6IX1vSEqCtXxCYQTkhh4Zv4l3
	+Sk8VIZ1LyV9zwd2jMFJG0xsxTPzIuBN5l1EKSh3nbResBcCvgW5zVatLy4PdMyEeAk7n8jIF7Y
	IRDtyZwwjZSVZzqqpU0rogl+tqB1O0K60PJk4g3H74jcIAlaNrGWjLsKcEqxpds6nJoAaWw=
X-Google-Smtp-Source: AGHT+IHPjmtJ0YhnFRpAFPO7FW7GDKn/qLkUS4bZYR9r/p23OTOkGfgsg/KzIYgHWXF39SKHQ7TGRXRwHtlC86TBaBo=
X-Received: by 2002:a17:907:7f1b:b0:b73:7d96:5c97 with SMTP id
 a640c23a62f3a-b76716db9aemr2424152966b.34.1764259869080; Thu, 27 Nov 2025
 08:11:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127155452.42660-1-dev-josejavier.rodriguez@duagon.com> <20251127155452.42660-2-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20251127155452.42660-2-dev-josejavier.rodriguez@duagon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Nov 2025 18:10:33 +0200
X-Gm-Features: AWmQ_bkZaNKY9PsNbF_lYOq5N8U5PsBQwE1WzozP3_OofEXzxp3swpNrRU_FPLQ
Message-ID: <CAHp75VeNtYJPmXtDfWEN3a184YXTKNems657UDeBKp4xpOGovQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] mcb: Add missing modpost build support
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: linus.walleij@linaro.org, brgl@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, morbidrsa@gmail.com, 
	jth@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, nathan@kernel.org, 
	nsc@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 5:56=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:
>
> mcb bus is not prepared to autoload client drivers with the data defined =
on
> the drivers' MODULE_DEVICE_TABLE. modpost cannot access to mcb_table_id
> inside MODULE_DEVICE_TABLE so the data declared inside is ignored.
>
> Add modpost build support for accessing to the mcb_table_id coded on devi=
ce
> drivers' MODULE_DEVICE_TABLE.

...

>  static const struct devtable devtable[] =3D {

>         {"cpu", SIZE_cpu_feature, do_cpu_entry},
>         {"mei", SIZE_mei_cl_device_id, do_mei_entry},
>         {"rapidio", SIZE_rio_device_id, do_rio_entry},
> +       {"mcb", SIZE_mcb_device_id, do_mcb_entry},

Perhaps squeeze it to be more ordered (yes, I know that the table is
not so ordered, but given context suggests to put it after "mei").

>         {"ulpi", SIZE_ulpi_device_id, do_ulpi_entry},
>         {"hdaudio", SIZE_hda_device_id, do_hda_entry},
>         {"sdw", SIZE_sdw_device_id, do_sdw_entry},



--=20
With Best Regards,
Andy Shevchenko

