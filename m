Return-Path: <linux-watchdog+bounces-4644-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96990C8F797
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Nov 2025 17:16:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 42706354193
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Nov 2025 16:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082D02C21F4;
	Thu, 27 Nov 2025 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPs5FdL0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A35554654
	for <linux-watchdog@vger.kernel.org>; Thu, 27 Nov 2025 16:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764260203; cv=none; b=hOmThMMqD5a5S5lnmFGNTWNYpuhNUWRvMsE0YH2/R6l6wBlDjj6v3z2SWaDh5UwRj3w7zJeT19Pj3lYsrvZ1a0dLuupKJQF+TVuD/IEzEVSBlCOfCJY9VXChoSMSWhN8SjvUhiT6vDPKx2YcI2OsdmrquYE50WpjPr54gUQYkHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764260203; c=relaxed/simple;
	bh=xDypKOX/n6GRcGDAU8VyLfV/rY9GENv82TIM6XTxRto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gQsC3H8Vhu9bseMG3ghKmwhaJsue7xYeob0jDHRtuaYWs5CQpTGgVVrkjT7vXl6kKt6VzXks2Yr5/4JARmorE0a8nBDi7dnwWdwVfAZPOciDoCMTkYENWqFn83Nzl9cQVwngoimtNhdYk2Q7RUf8Iqr0Y7J46fZeCyYG7djZ7x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPs5FdL0; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so1818852a12.0
        for <linux-watchdog@vger.kernel.org>; Thu, 27 Nov 2025 08:16:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764260200; x=1764865000; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNO28PzgIsx+2Ndb8A3ECc1R+7TzxXSai5xVu+osWaY=;
        b=KPs5FdL04I8adeZnQ9V4xT1D/R21qLv4bEymY7y1NKEsv1aSHOxF7+0WOhOANz6hEu
         H0t9EqE3YzDceOOA3aOZJ50d9mUgX6KkcBRvBSfaqWx0Vx5/aQXfdqzXkhrn9NrISEpq
         FNhREaJi6TU+fIpTf4p3drfvf7RVIdc9L2+mIuGhqUNNVtnf4tdoPBB0GJ8B1hso97xG
         XEQnXkv895T5F58P8cYDt+Z/7cV2HHFfsC5TbUh7o34q52u+qWHcnDjbG1vyCouftlhm
         Ojjghv40AkxBRREjFwcO5yf9SysAncr+yoDaaiYIpcUnwfWjCWKTlUaJcVSdFALHypzg
         bynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764260200; x=1764865000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KNO28PzgIsx+2Ndb8A3ECc1R+7TzxXSai5xVu+osWaY=;
        b=GUtZfv/2cEK+BRbMNP6Tvsi+/X0OCO5QnHXO/2MuvE+AC12XTFTcH77uhZhZGvIb6w
         2GclMfDelNQP8PIB7lss618aDpFNhB94ubTMDLVE8AHYriuE3Vl9uI7mFJBl34BDjdsa
         MX6Xvw5QDCbW0G3M3R8TCO+dIomDXEwN4874KuQ3IFReHCK/ltSeHybQgn9ubXKvyg96
         tL5jYcXoNnzw5ZKvn1Qgi+kF0tyqtWXxEw9XGiD59m0iQA2ngMrgfoeRL/lvylaauJ/a
         puLOPj/drdzIPmFfgEK8C3NVEceEglbw/FgeMrkotaBDcUz7DT4TLEufjhLy5axP681q
         G5Ug==
X-Forwarded-Encrypted: i=1; AJvYcCXh0inW4tBv9v3TfoUyUqyvWTNFABccwYjHjASWL1kqSD6t5jl6vzMi6QfuAwarU8z7ibr4NpVYsTaR7YjIuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ctOOmnLnWEfRzbRsCPThn1Rm0xbiMUtUCQXEmcxpPjCgYBiL
	HkAsnDjJgVEgTTp5vqSSSP/TGyKvHI0GMDNI2lF24kRFdRPb2paC5pODfpVW+z7WCD6JCgHBP3/
	RnYkwswtywAu8J/OlSZb927YbUu2wzJ0=
X-Gm-Gg: ASbGnctFrYF3KOCnitSEBr0vCSbpKcaGrQboHXZBx+5yTTgqYG+Zij2n/pAXCCc7MDk
	SXQoEzKf/5cTZC9zvPtW2wFt+zOak5Z11O0j4k3bYAK6IX/8ttWo+BrDTutdPf8/P2TAhiRPUP+
	tVUO+9kmhELrfVeDVsiP1vgpgfG5+d6mwR7wDBuRL321T5txOzyOEe6pXAfVujzLAipV2G3N+M6
	66LVtuF5h4BtJPAXpkdHYtFInMawSaBTaVMXxHk0wFrOAUmQZgpnYo2oPkFG/a4tDvs3W0ui9YH
	yMFtA1ad4DGXBhPJqV7ly+i3mxYxPHPt5zcON1Cz8k97zoWxhdgJqLxl3DZ618sZ3P0x/GM=
X-Google-Smtp-Source: AGHT+IE6et7KPZp2GkXfofcAVlXzT7muZvGR6VaoGxIvgHz2tucfIoZqOFaUmU2ZIt9fSGn6WlPk+6UoVkEjoIjxQZM=
X-Received: by 2002:a17:906:f5a5:b0:b3f:f207:b748 with SMTP id
 a640c23a62f3a-b76c547167bmr1211487466b.10.1764260200132; Thu, 27 Nov 2025
 08:16:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127155452.42660-1-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20251127155452.42660-1-dev-josejavier.rodriguez@duagon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Nov 2025 18:16:03 +0200
X-Gm-Features: AWmQ_bkZa2nrqUftdjH6MAYONe3JSVeW4Th2GGUqnpqYo2uuwkRVZXIvhkoPc0g
Message-ID: <CAHp75VdvJUFwFBRKT+iqwQXiK-toah3gZq6pX9Omcp6d2R7g+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] mcb: Add modpost support for processing MODULE_DEVICE_TABLE
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: linus.walleij@linaro.org, brgl@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, morbidrsa@gmail.com, 
	jth@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, nathan@kernel.org, 
	nsc@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 5:56=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:
>
> During the process of update of one of the device drivers that are part o=
f
> mcb bus (gpio-menz127.c),

> one maintainer of the GPIO subsystem

Krzysztof? Did I miss something and he is now a (co)maintainer here?

> asked me
> why I was adding new MODULE_ALIAS when I also added the same new
> information on MODULE_DEVICE_TABLE.
>
> You can find the messages here:
>
> https://lore.kernel.org/linux-gpio/80a20b13-7c6a-4483-9741-568424f957ef@k=
ernel.org/
>
> After a deeper analysis, I came across that the mcb_table_id defined insi=
de
> MODULE_DEVICE_TABLE on all device drivers was being ignored as modpost wa=
s
> not processing the mcb MODULE_DEVICE_TABLE entries. For this reason, form=
er
> contributors were using MODULE_ALIAS for enabling mcb to autoload the
> device drivers.
>
> My proposal with these changes is to complete the mcb bus by adding
> modpost support for processing mcb MODULE_DEVICE_TABLE and removing
> MODULE_ALIAS from all device drivers as they are no longer needed.
>
> Jose Javier Rodriguez Barbarin (2):
>   mcb: Add missing modpost build support
>   mcb: Remove MODULE_ALIAS from all mcb client drivers
>
>  drivers/gpio/gpio-menz127.c            | 1 -
>  drivers/iio/adc/men_z188_adc.c         | 1 -
>  drivers/tty/serial/8250/8250_men_mcb.c | 3 ---
>  drivers/tty/serial/men_z135_uart.c     | 1 -
>  drivers/watchdog/menz69_wdt.c          | 1 -
>  scripts/mod/devicetable-offsets.c      | 3 +++
>  scripts/mod/file2alias.c               | 9 +++++++++
>  7 files changed, 12 insertions(+), 7 deletions(-)
>
> --
> 2.51.1



--=20
With Best Regards,
Andy Shevchenko

