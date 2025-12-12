Return-Path: <linux-watchdog+bounces-4684-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA4DCB9C12
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 21:21:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6A53230146F2
	for <lists+linux-watchdog@lfdr.de>; Fri, 12 Dec 2025 20:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608BE2E7F08;
	Fri, 12 Dec 2025 20:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsDwdGT3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF80927CCF2
	for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 20:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765570876; cv=none; b=b8XfSGtcYa1wPIEjzlRHh9DzVFp8hCgHNZNml1uR+/ueeYvC7pQgqtMN+298Hc5PAjIHTdeez088UGfYWIg/+Bpu6MZmqx4hZw3CP9Q8WIQOnom/8ezeYEuWTEo19nbcO2saPI3+OE44GcAHKp9/zHqFj9H3RhSK6Uo81+h9g/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765570876; c=relaxed/simple;
	bh=Q8uvsyeWJd8z1lfWIT37Ah2XP8Wn4M/TKWefkP/OlCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mu/6pd0TmGBxFKctX7lIBY9JYccvRBpDATiDAj+wfB4v2A890jyxh23VY9tsH7jSsOPYgfWXSC/txO2oZjEH0EYGwrRCDSHmDukkwwFjwfZgu3pcj0ElV4Ra+kLJOYswK6i0/DVYrWZmSYcx3V7PZ8Sh7zJzVkpaFDlDtStAc5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsDwdGT3; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5dbe6be1ac5so704341137.1
        for <linux-watchdog@vger.kernel.org>; Fri, 12 Dec 2025 12:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765570873; x=1766175673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=57xTfcgVpdNqwQfEhn5rzBJsXVGgfk4jgHLexLMwZAY=;
        b=hsDwdGT3Ri/d38dEr1wnMAijZSGBLNSC79dTt7ZVpO2Dtzb1gKmieKlfZLUY2S2WxS
         lxsB1tHVmJPh9Ky/9axsjIsQM+aa9VnIppN6jir9Gq/uSyVSJTW7C0uaJLuGTFfUJIy5
         cifALW5OgqqMKOkhjZHYLxlXxeLq8kZNFag5AcqdflnFTPUt0I+601kRMqktRo0FhKIW
         tmvJ3zRaApkIoDYqDwBTNfcl3jzatQj0EpPT/t1vmmow//Nj3WAXVq6qLFymnRYT8NQk
         OVEM60+kRwVr8nxqtcyIFx6XR+P2eOULUu4GGqQmP+s8QKM2S9Ykq7DPlupbPMXyf4fs
         28oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765570873; x=1766175673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=57xTfcgVpdNqwQfEhn5rzBJsXVGgfk4jgHLexLMwZAY=;
        b=wtwjykxPCeNFzexoC8vEAFBzeOoku5+/eS2CKXF98Cs7wqNHk+dZLOcx6MJacpTvEE
         Kris72QzhCMZZSQAZ26XHk+GaSdwa8nbYtEmY7vWo2qpHaBGInT9bFW5uIh8C+CFP8IY
         0PJecZjU/PvXUxRh2YtyaN/2P8wbCZCPIhpkzdPRMGBQcGrz9tmBEHcsFPNeYsL/m0RB
         WX8YabZR/2o8O/yLydOSZrtJAXCrNC4Z3dPZ0vbkrjxXGm+r9lqBlfQDLm8Vq36vSv91
         ySeLKycqOrvGLph4gRGEHo5kXBnjz72CzxvMeZErdRnddo2rzfvnnsAjy/nbgjtflXm5
         XTuw==
X-Forwarded-Encrypted: i=1; AJvYcCUQiGtN2ywjKU1AXjP3+CZQRoAvhICcqhsqIqG64i0kFwovrWlGlpdh+qGSeH0/q5HbUSR5R7A/Hdnn+Jc5Wg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWFqMb5ad4D89PfmsHop99sR0tbIOqkyv+rEUgef5Eo5D0N+ea
	dm/8lCbl9yW20gK0+nEA/WSimJUwGDOYMkRP+HM7x3kO8GFgP0HkZDHFMzroeZBTZYA9/zxb8lc
	OoEUP0zh9GSu4mAi0KTS3Ua0TYLvxxZ4=
X-Gm-Gg: AY/fxX7w+geS49Bm78yGk4yq9gwR4noTaGLTy53u9HOYsGbdKHAIY31YcFRl09IINfF
	Ho0rtxxAEhJctVHiifcZLBw8b185FF/ULLmf4ScqaejOfVrJUlhkaay6xuD78XDNWFVfsLy1W3D
	v/F3FXoE1wrW7KL6KfHfs3WNIluFt1OgMcsim9eCZjQ56sx6kXPU7Ug0Kp3IERkANbkf3n+R2Mt
	9bwNgAnTGyrcLJzbitfeKKorSbPt8ho8D5Ho6cgFNF+SV2Lq4MBM6syR49JJDpg9hJkXg==
X-Google-Smtp-Source: AGHT+IGEqhmEX506+apzyfArmqI4dg+6NsUn1OTiBR84fq2h6XG9EIsJ3R+DxV5rp35Eiec6hSf/bqjv/EKmo7qkMsc=
X-Received: by 2002:a05:6102:1525:b0:5e5:63e3:ebb9 with SMTP id
 ada2fe7eead31-5e827840190mr1151656137.40.1765570873530; Fri, 12 Dec 2025
 12:21:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117.131124.1452225967649047223.rene@exactco.de>
In-Reply-To: <20251117.131124.1452225967649047223.rene@exactco.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 12 Dec 2025 13:21:02 -0700
X-Gm-Features: AQt7F2ogkOSvJofUxoUQWcxC8Ldv7yoYJ-D4SZacoznuol3A7sc5vslpXdwBl5c
Message-ID: <CADvTj4qEVD5vZtHcmnFMVh9Zr7LPPhBYCVVGjx_4UtH8yg6Hjg@mail.gmail.com>
Subject: Re: [PATCH v4] fix it87_wdt early reboot by reporting running timer
To: =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactco.de>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 5:11=E2=80=AFAM Ren=C3=A9 Rebe <rene@exactco.de> wr=
ote:
>
> Some products, such as the Ugreen DXP4800 Plus NAS, ship with the it87
> wdt enabled by the firmware and a broken BIOS option that does not
> allow to change the time or turn it off. As this makes installing
> Linux rather difficult, change the it87_wdt to report it running to
> the watchdog core.
>
> Signed-off-by: Ren=C3=A9 Rebe <rene@exactco.de>
> ---
> v1:
> - just clear hw timer register
> v2:
> - detect running hw timer and report to watchdog core
> v3:
> - multiply TOV1 in _wdt_get_timeout
> - don't wrongly and superfluously set .max_hw_heartbeat_ms
> - don't call set_timeout manually
> v4:
> - simplify to wdt_running
> - move code up to not move superio_exit
>
> diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
> index 3b8488c86a2f..8ba7e03857ca 100644
> --- a/drivers/watchdog/it87_wdt.c
> +++ b/drivers/watchdog/it87_wdt.c
> @@ -188,6 +188,12 @@ static void _wdt_update_timeout(unsigned int t)
>                 superio_outb(t >> 8, WDTVALMSB);
>  }
>
> +/* Internal function, should be called after superio_select(GPIO) */
> +static bool _wdt_running(void)
> +{
> +       return superio_inb(WDTVALLSB) || (max_units > 255 && superio_inb(=
WDTVALMSB));
> +}
> +
>  static int wdt_update_timeout(unsigned int t)
>  {
>         int ret;
> @@ -374,6 +381,12 @@ static int __init it87_wdt_init(void)
>                 }
>         }
>
> +       /* wdt already left running by firmware? */
> +       if (_wdt_running()) {
> +               pr_info("Left running by firmware.\n");

I'm wondering, is there a way other than looking at dmesg to identify if
a wdt was left running by the firmware? I'm thinking having an ioctl or
similar could be useful as a way to notify a user that a BIOS or firmware
configuration change may be needed.

> +               set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
> +       }
> +
>         superio_exit();
>
>         if (timeout < 1 || timeout > max_units * 60) {
>
> --
>   Ren=C3=A9 Rebe, ExactCODE GmbH, Berlin, Germany
>   https://exactco.de | https://t2linux.com | https://rene.rebe.de
>

