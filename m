Return-Path: <linux-watchdog+bounces-1103-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D92508FD5F6
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2024 20:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 767DE282B82
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Jun 2024 18:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B23DF78;
	Wed,  5 Jun 2024 18:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJ/7EgQq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824DED512
	for <linux-watchdog@vger.kernel.org>; Wed,  5 Jun 2024 18:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717613151; cv=none; b=g+NGSt+laneUklXTC6HN3lfztEmqU6HI88WCICzHywkcKnurzDysGmBxQjQaVn7927/U5piS3yg6IqDiAQWN/wGliLVxydA+LKe4RKgafDOTctNz3Nf6+a2cqQfrh1+8+U4cnYw3B4KrdsPsstXKXk+5eMWMjQZAKiXG0la9ZEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717613151; c=relaxed/simple;
	bh=KO3YJpszn4i2dYWjd6GDXV+JNvlKtW6b8xd+9T4kcl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MnFNPXepah/lfmZ+Jrh5YbmeV+3dcl3cPq+BdvzkrZhifLpLNi0/hiYupmtKchoCHCmN7791SPvGlx+oHuqUanXZKHhn0CRWx+VFdA5gXMCbmsHXNjSMjkazPdvaKDRdVQ1nXLUJPfHzrJmV24q9sKXdn45IgQFZBcZuhj2FzKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJ/7EgQq; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a68c8b90c85so19612166b.2
        for <linux-watchdog@vger.kernel.org>; Wed, 05 Jun 2024 11:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717613148; x=1718217948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KO3YJpszn4i2dYWjd6GDXV+JNvlKtW6b8xd+9T4kcl0=;
        b=QJ/7EgQqt4FkNUlv0wUan8yd01nQIUA0P13BZZS0YU3f+H230BkbxnqN6pFCFGMgiO
         tzdO2tyn5rvGUHvf0NXCxxzgV1faT3sZ0tBzv7zahJCrKzmMA1c1MF+V8w8fDthRF8Tt
         Mode5+lf2ZpXtBJk76K7NaYwXluwaqeh2bHjx0aMDk5JEGo/Y9CEeFZtnNZsDtloU+IA
         abJOMcUOhJ0J6LWGXVkgNM6pCn8OivayZVLYVJIHCnTNHVt03ZSVeMk5VqT03Vs/0Ul3
         U8rnn6q61LHMOG2LSDRiueKQhBdIDRQzDpDcy2jfN/zt79fGeDEBiAOd/3fx+lzKy2GS
         Q9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717613148; x=1718217948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KO3YJpszn4i2dYWjd6GDXV+JNvlKtW6b8xd+9T4kcl0=;
        b=m7NkmbcS/VUMZtxDAq3LE0cJc2NKy8UeAC4bjgDtaG4+yWobJ7xl91a0AVDR5gz8zW
         iAcWJV42wXF34zuwIZrwbJX6tGnf0PETgwZd9bi+u171oLBbQFrrV13sDg0nLhRJfL3n
         xlEJ11ttKxcIrRKk/SmhVgGCa/BAK2TICwIwjr4c3CFHAF2sQ9YxgisNNFRXJJmq2lHq
         t5zuSjUx8JqHD20+wyuHvKV6lGS/+SCFSLZOELmDLsaIeIHyNwwr3Lk2ElBOTVfXR9oz
         H8AbsduZGvrCMqKcMSvDkgQ6IF6KAuiQSoqvrtT2bH8GodfuzuGueyTSCkQExqX/ennD
         PFMA==
X-Forwarded-Encrypted: i=1; AJvYcCXkvngyFeEV0JLcX6A+64zet02FfyjVmdrhXVN+2Y/vt5w+Pi6H1Zb6QAqyk2pfLZ4mhkTBZFkeu4ixOlLNPRNZrTqXUlIKU6VdehresB8=
X-Gm-Message-State: AOJu0YxWHcatzFehGBPvDCWZw3VHjJfTCTq/0xgbelocTmstADzDFsgf
	ta8g0H0waua5BqveZysvt+ZN9YbdFFZ/4rJEl5QuptZsj/9LQwAjzE7aTdZIGztNptYrKBVNYgN
	Cg42VGlFJo3lPYJ23ydywJDhM710=
X-Google-Smtp-Source: AGHT+IHMAqLqsfwgU4jp0MKB/YVD1Gmi/UuOwjhc3pR/zh3OZZjcWDqxUdG7mpFATGq7swY87VEpnHuv+bckNYFhb/Q=
X-Received: by 2002:a17:906:ad9:b0:a68:b73d:30d0 with SMTP id
 a640c23a62f3a-a699f363821mr271306166b.6.1717613147772; Wed, 05 Jun 2024
 11:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240605161851.13911-1-kabel@kernel.org> <20240605161851.13911-6-kabel@kernel.org>
In-Reply-To: <20240605161851.13911-6-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jun 2024 21:45:11 +0300
Message-ID: <CAHp75Vf6U1dSKoGkgQsk_u55H=zjhce=VBnnn07pqu+VnVBR+g@mail.gmail.com>
Subject: Re: [PATCH v11 5/8] platform: cznic: turris-omnia-mcu: Add support
 for MCU watchdog
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	arm@kernel.org, Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Guenter Roeck <linux@roeck-us.net>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-watchdog@vger.kernel.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 5, 2024 at 7:19=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org> =
wrote:
>
> Add support for the watchdog mechanism provided by the MCU.

...

+ bitops.h
+ dev_printk.h

> +#include <linux/i2c.h>
> +#include <linux/moduleparam.h>

> +#include <linux/turris-omnia-mcu-interface.h>

As per other patches.

> +#include <linux/types.h>
> +#include <linux/units.h>
> +#include <linux/watchdog.h>
> +
> +#include "turris-omnia-mcu.h"

struct device;

Alternatively instead of dev_printk.h + struct device forward
declaration --> device.h.

...

With the above being addressed, LGTM, FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

