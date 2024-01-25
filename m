Return-Path: <linux-watchdog+bounces-494-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544DF83C425
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jan 2024 14:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BFAC28B86D
	for <lists+linux-watchdog@lfdr.de>; Thu, 25 Jan 2024 13:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49D85F565;
	Thu, 25 Jan 2024 13:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UfH5Y4j+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1D0A5A79C
	for <linux-watchdog@vger.kernel.org>; Thu, 25 Jan 2024 13:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706190971; cv=none; b=OjGKkXBuklhuCd5SO1llFhodKhIfcIbRE++ProJFfZ+7LNi3HIiu6yK06oXRzxMS9XravEI/0inlXcxOsaBy+owx3YvQ8IGUrvgvH/kthD7W97fuDp5rWuLsaEVpKQIKk6e/dYeFvZMuqcV/sRhyHhWaQP5qf5rGaJBKC3Z+Oag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706190971; c=relaxed/simple;
	bh=1W9WzjA31f+QWbBJtAN4LPmsaACvO46+1VesrnmG9rE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WxnqPGBqOaev6F8LuaLyk7cnmxkRKgZQjd/xhNGs6DOkoWvSXTaKV+ITUszxGYMLqfLziVnj9599u32EorM4ljDkyuBPPXZWv18SQVSwSfF8vEQBOPOdnWLD7DzDHvBsvuvHsbDCCwBGuljk+f4+XWSfNgnYGR+ne3HYRQKDHWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UfH5Y4j+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2cd33336b32so90730101fa.0
        for <linux-watchdog@vger.kernel.org>; Thu, 25 Jan 2024 05:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706190967; x=1706795767; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gl7ci9bKGwzAV/Piftg1NztgrDQGV69BjHXq7xOdai4=;
        b=UfH5Y4j+kuXggm336J3xoPKSIVwor79inW1F7FHtG0E2Kl9iC9jI0MWxMN7CgfmoAI
         cGPZdyifhJHvBA8izyu8IXhTMvTpb57sEuamDvz0ub/BKe7J4s24ReAHBNK78eGgrnSU
         DsziiWCXVAiFgFsHXByVPMd9IHV72JkvrtVFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706190967; x=1706795767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gl7ci9bKGwzAV/Piftg1NztgrDQGV69BjHXq7xOdai4=;
        b=s8P4Z4cVCzJ5vJrzRM0cpiYlmsDGZ/QQZN0ti8je05FP4USu1PQziOjWZ/bYDUVRSV
         t1OUBzF6x6Ts2TKrsiYnYPeEPtcibgehT5tMuMUbLEFtw2xgIuppRolF4Aw4t7XF/blt
         TPudKz7HPtKq3P3IwLfhlNylFgcnwqA1abWh2I5HlHtmg9aRseQHVbN90JwGnVrFYaAL
         dDAYfGNyNbAVyURyzwYQVLihoKDnCdbHsz7CzN3Sv/61eACb+EsK6SQr1jKjYioWAFFB
         yNTWqNiLzBVPdls5Ewns+xpf9dAVebk+p/TroB8i0DC3n3baWdCkgIejJn1czMQ+Rc/T
         FYHw==
X-Gm-Message-State: AOJu0Yxnokj+Vnxqma2B6q6zZhUrTbT6JNOQteOaA/ztCt1vUNf9O17W
	1WyAa0yo0ztNloCJKiqCUFdcHxQumolog/xcPJpPITMDL0sCwTQfcLScRq3oEoCyAXdqinwAi5N
	vgWZ6Y7ITKkC4v3ztJFYss3vwSpoofn8bbEQKkoSk4OU8je8=
X-Google-Smtp-Source: AGHT+IHTL+gSOIeOXE6322kBzt5pebjRQ17maiu2CeRm/+cwYjTPWnzcXjMAr3OR6+BB3/cIFHz5oUrMSyVWo2pt2X8=
X-Received: by 2002:a05:651c:201:b0:2cf:33b7:9050 with SMTP id
 y1-20020a05651c020100b002cf33b79050mr700956ljn.12.1706190967013; Thu, 25 Jan
 2024 05:56:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119084328.3135503-1-lma@chromium.org> <20240119084328.3135503-4-lma@chromium.org>
 <170618986350.1469172.17149163593213396683.b4-ty@kernel.org>
In-Reply-To: <170618986350.1469172.17149163593213396683.b4-ty@kernel.org>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Thu, 25 Jan 2024 14:55:56 +0100
Message-ID: <CAE5UKNp5oorZMJwor=8Z_2wtCSS23Q1-25_RNoDHNi1USx5_7Q@mail.gmail.com>
Subject: Re: (subset) [PATCH v3 3/3] mfd: cros_ec: Register EC-based watchdog subdevice
To: Lee Jones <lee@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Radoslaw Biernacki <biernacki@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 2:37=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> On Fri, 19 Jan 2024 08:43:27 +0000, Lukasz Majczak wrote:
> > Add ChromeOS EC-based watchdog as EC subdevice.
> >
> >
>
> Applied, thanks!
>
> [3/3] mfd: cros_ec: Register EC-based watchdog subdevice
>       commit: a1958f84deb5cdba020af725fc5003a05af4819c
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
>
Hi Lee,

I will send V4 of the patchset to address Krzysztof suggestions, in
that case I should skip adding V4 of this patch and have only patches
1 and 2 in the V4 patchset?

Best regards,
Lukasz

