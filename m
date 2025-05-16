Return-Path: <linux-watchdog+bounces-3513-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A74AAAB9CD4
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 May 2025 15:02:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 417381621E9
	for <lists+linux-watchdog@lfdr.de>; Fri, 16 May 2025 13:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7D0923F40A;
	Fri, 16 May 2025 13:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2nr14y1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4942D22F776;
	Fri, 16 May 2025 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747400547; cv=none; b=GQqf+p8JfRedO6E6y4BKU5ixUlw4HRP385kE8nQHezrCIxVGrmr7kkke33JydDLFOaL904gONMqcM0msAVbOYiPocBeGqTUiV2cHgHdq1IDzGiDxvboj9aUfkdWmfyBaoiOUpXGlAwxsgiAd50+A+kDuiTJjxUaS1ymh9CGXcHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747400547; c=relaxed/simple;
	bh=KVS47/XoSWd+fNXjULjdUBqXz+ZFamPMM11G3krrkqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iG6le0y0eLe01mizk9gwayCY/COdZ6x4wm3ap28AmEkvxUbq9jr9re6XSO1FZbe3BPke6J8276jk4h0SCE61mo5dAcRg6xnVcm8L4/sviB6Dwp3xM230zhEvA0JuA+H4lL5WyVWiGkka0wCHbCyPxmcJyyDXHzKZCAmjAbgWhvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2nr14y1; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4769aef457bso25868051cf.2;
        Fri, 16 May 2025 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747400545; x=1748005345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8EAaXCcBODOqPPRNoOnVtfPFAMjr1gPjPXMHsuSlMuo=;
        b=E2nr14y1g1Lz/4z7YUukoAjnZgKb8b25fCNOYcHTzzHx2kN2C5X684cWPHDEVz9Tyf
         K6Q5pZWQvRk7qHd9rDgJSLUSOCmrnkgt/Q3AOO4jTSgLT4Fs0RovchS9R8MAPIpOwnhV
         cBVZ/Cmib6swuxrQvqxAvdbJC2BgxJjI55ILTdXECyZRRJoerC0l0OfjtQpXW2YpzLWh
         cs1hPBT7X70WEMQz+aEMaqKDeNYmP9SiGN8BZoCysMEZz6FhNIqHblV+RX5GesEBxTI1
         0Ge2Ua9njXlATNNuS7i3ZDSAvBpthhtA8Leyn0XEUzRvNR55CTn0iZ1W5qDnyFzFoztJ
         scBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747400545; x=1748005345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8EAaXCcBODOqPPRNoOnVtfPFAMjr1gPjPXMHsuSlMuo=;
        b=HyHnjiAxXSs2jZ9P+2FHD4oBrhet+d267HRIhWvOEWNviWuViWr5+e82NLY7APZzby
         QS+l7iXF8AfEPxFcZPjCXU2Ruq0aTLODvOPZTGugucwNroyPR2bNY8mrHNNBEBlTtycE
         rO9Ct1OihbGJViqm5uPbxt7gSaGIN6SkuUX+6AMZ+LueEzmTlaL/VCUrAQ5mY4rUn68V
         dpP3FNVzzlLDAYIAMkYAQv1inv8OXjMkC6H066qghCJN625hh5d8bjFbf1VTZm4HUHrX
         MDsnjX2b14gZ/vtZk2xE4TidIm14Of3cH5W1+0xBr3aNbdtPISlcMnl/l5eZdYeD9uuu
         SnUA==
X-Forwarded-Encrypted: i=1; AJvYcCVc965D/XG0d42qoacOnDWVDYFi3rC+DUCcudUQuaGn3T4XL/6HZpdsJx9DUfop0QDucqbG0YavRbSw@vger.kernel.org, AJvYcCVwtyDgCW1ZcpP2IRTI2Rgg3OCTmNdgawohNwVgl1Ai0B+f74EN19pZs80Lq8R4JPpGPyl7Z7QkERQMn06Z@vger.kernel.org, AJvYcCWQ2VBHUSSjWZjenNnza9o54n+b79G1hfLMs/zTdWvPF9Q2ZB3DRDfZheGxmNqa8+uedZNBJZn+KolaazTBH+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0drwebIekIbu2qK7g6KlE7RhR9YTdMRXn4mAaxIYMBRW2Xq2e
	ds0qOLxv5EPR+pyPi1DP4Z9n+LRG/V+ONAH7CpVgYUYiWClR7FbdKVX0dnEtsS/40V9Z/ekhBz5
	qbG3U1/16sWM3A1PistxPTPifi1QprAk=
X-Gm-Gg: ASbGncu8XG6vKkNrhJs4dPa4N+nkrtalOpxKg/7HN11wC9glgAqWYTYhyCw7uwysdKk
	Ew9a3zFButJ2BJbIojgUVmLCY+jWfQeVTsGC9pDTCgGDR8/3oe350atVzV96kAd4XtbGMfmrIv8
	xy9LR0J8E5aXwhJHIR4JSsXoievqWMc0Fbd/gB5gTcpKk=
X-Google-Smtp-Source: AGHT+IHZyJqid//wCBlVNP3pcnUuvkjajKER+xeFHB1o8i8ij6OKhPHYHUDAmLQb9yNNQCp7v0lXFOO9XZFKzyx4pHM=
X-Received: by 2002:ac8:6f1b:0:b0:48b:5656:bb01 with SMTP id
 d75a77b69052e-494ae352f98mr41415291cf.10.1747400544544; Fri, 16 May 2025
 06:02:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515-vt8500-timer-updates-v3-4-2197a1b062bd@gmail.com> <202505161430.wdURc0TG-lkp@intel.com>
In-Reply-To: <202505161430.wdURc0TG-lkp@intel.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 16 May 2025 16:02:13 +0300
X-Gm-Features: AX0GCFuUyfeKPyuuQKwLTH_a0JHlANkAjiXIiU8TmkAt1AD4XrUds-vQSs5nQng
Message-ID: <CABjd4YykcZckQFfyuSpMtCJybq2nQuj9TYAP2S7RfivPLYPUnw@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia SoC
 watchdog functionality
To: kernel test robot <lkp@intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025 at 9:56=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Alexey,
>
> kernel test robot noticed the following build warnings:
>
> [auto build test WARNING on 92a09c47464d040866cf2b4cd052bc60555185fb]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-=
bindings-timer-via-vt8500-timer-Convert-to-YAML/20250516-025729
> base:   92a09c47464d040866cf2b4cd052bc60555185fb
> patch link:    https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3=
-4-2197a1b062bd%40gmail.com
> patch subject: [PATCH v3 4/4] watchdog: Add support for VIA/WonderMedia S=
oC watchdog functionality
> config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250=
516/202505161430.wdURc0TG-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250516/202505161430.wdURc0TG-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505161430.wdURc0TG-lkp=
@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    drivers/watchdog/vt8500-wdt.c: In function 'vt8500_wdt_probe':
> >> drivers/watchdog/vt8500-wdt.c:98:44: warning: conversion from 'long un=
signed int' to 'unsigned int' changes value from '6148914691236517' to '328=
7081637' [-Woverflow]
>       98 |         drvdata->wdd.max_hw_heartbeat_ms =3D -1UL / (VT8500_TI=
MER_HZ / 1000);

Will change to U32_MAX in the next version.

Best regards,
Alexey

