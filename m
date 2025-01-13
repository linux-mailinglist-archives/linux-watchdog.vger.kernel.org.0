Return-Path: <linux-watchdog+bounces-2684-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2F0A0B977
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 15:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E84DB16539A
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Jan 2025 14:27:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F50F23ED66;
	Mon, 13 Jan 2025 14:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RTFFo/Nc"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0876B2397B2
	for <linux-watchdog@vger.kernel.org>; Mon, 13 Jan 2025 14:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736778459; cv=none; b=Oc5YsdQWKAPffKLLn5cQUEgcA5gNCro3E1sq8B/oz+dw70MtuP6N4B9h9CQpNkM8Xrx45JkBu1w5TXhjGEAkCycvwqTf1flBj8Kr36fDILdqdv2Wo8FbC8j0GH1oQplvhBM32IkT8qIPLGKHpOlg0MedNlS7yLPnNm29GNSmPNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736778459; c=relaxed/simple;
	bh=9COjNnYSCnP8zzlKxYLZwJwxNyQ7tz6+0SRpVTiaoKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I4mRSqodzpOZjo31GmRR8sCbQLUSSoXBbY5BkfWFWZlFBw4KyFI/yM+MjR/KRcXdGCthrpzkdLD/VOUmaLJ99ivi3DWYiXFdyIqq/UKH8jpk8tJL93RHQ8+cSTfno//BHA3N3lCR653/ORkJwKIp0xDwnQ0b9yMkCIbOeVEF9LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RTFFo/Nc; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30616d71bb0so13920211fa.3
        for <linux-watchdog@vger.kernel.org>; Mon, 13 Jan 2025 06:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736778454; x=1737383254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9COjNnYSCnP8zzlKxYLZwJwxNyQ7tz6+0SRpVTiaoKA=;
        b=RTFFo/Nc0I67EKGVoQ2fVY+cBYZ1TOo4yfCkuQsrfXiUN/mMDNf6gKE+5xAGtzcZr4
         S4LQ/2JOuspC6iCEE6RPYMePSsDMdxS96zqIoZ6zkeHgAX5KEv6Zqj0banLzNt1rcx/D
         wtF/RTZoReuro9wI7XOMvVU/Ne7O/mmmPbcbo98ltio+r0vjyTtOeE24eW51Cy73M2pT
         GuDi+9Cv5csdLtMI+/KXAHpuBCDNKIMW6MSrFFVP1CBPpYZW2WFpNl5h41yd6IMDr15r
         OuY4IANWYquM0Ap6hYB2mGitr/D9Z8IcxjFNNLymHhIi4pgkp3NYGW/YJ/UoVlo7FMxq
         xnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778454; x=1737383254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9COjNnYSCnP8zzlKxYLZwJwxNyQ7tz6+0SRpVTiaoKA=;
        b=G/6QanvGCoNQlt9Io7lUwTvJemPeXhP3r5ALaSKV87yQfgR54EhrdFaNf9NSAaCyjx
         1U+8sa9Rpjs3cZCM3fczbLBCXXYo+0AooYT0WvqXwR8kOzlYJfTih6nkYjwSlSdcUaf8
         09NDiQdEX6/vPRCDbJwrJqc2gyJZxnYyvtX6naJ09LB7pCxewdJXk5QDT+5BPjrzu/K8
         uLUgF0Nx/Oh/N7ngkhW+64jR9+csNP8328QUUiwsfQV9VYfwh9TAPr19qCfpNgFKmFEq
         88QrdTJDuEwDzOVgrgf63pOeQJ7VADFXfbeoWsLGUHUfhq1CDUkdKIy+LkTAhM5ISEKq
         +pGA==
X-Forwarded-Encrypted: i=1; AJvYcCVjpRGm5r6PspePUn3hLUxX2YD6BL9tiiOGfs2lZ2Bm8UZP+rxmahjcxIO3NboqDT36IlutJUJ8ZZoBJud1oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YymAzNYC4JYQ8YyYIwbF1quCsY/d/K7wOMWWkU7fRTEih21j4Ds
	V2gtlC4/imiezUIEX4pILDPCXiuvWg2xxPdsWNhcppC0hQIcQdWmQrfaD9IMCySw4/H2m3nF8EX
	P7Hr0d9ELfoA9GxD72x0hJ6TMHGXegfEzCHb84g==
X-Gm-Gg: ASbGncvHkmB51XF6sgz8oZWUl5D0U2ykivKvbQ/2M/hfVvqSmoPeU631w8kP9PdC566
	Qs7jSI/DB4OqIbltFbAjOaN1MYgQ2aZmCtDir
X-Google-Smtp-Source: AGHT+IFMYdQtB6thju+Ujdvh+g52bV07bNIc66J4gueu0snzInT0RR6j0JQTqPJk7Ksj973O3ybZVrtFDEZoewU6/5c=
X-Received: by 2002:a05:6512:3a84:b0:540:357b:2137 with SMTP id
 2adb3069b0e04-542845d1b19mr6514038e87.26.1736778454280; Mon, 13 Jan 2025
 06:27:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241227095727.2401257-1-a0282524688@gmail.com> <20241227095727.2401257-3-a0282524688@gmail.com>
In-Reply-To: <20241227095727.2401257-3-a0282524688@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Jan 2025 15:27:23 +0100
X-Gm-Features: AbW1kvZkOrvrzVjSbv0zK88kVQwaAoATB6fakJzdiYtYFp9GmQSO92IIKLuVefo
Message-ID: <CACRpkdYxtfrgs=Y=OVDjdRu-a1q9qPBdm=yeHojOaCyN5ou0Lg@mail.gmail.com>
Subject: Re: [PATCH v4 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 27, 2024 at 10:57=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:

> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

This driver looks completely reasonable to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

