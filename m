Return-Path: <linux-watchdog+bounces-426-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75822832AFC
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jan 2024 15:10:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16B8E1F23F6D
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jan 2024 14:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22D0552F69;
	Fri, 19 Jan 2024 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uv7CHGWi"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B52554649
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Jan 2024 14:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705673438; cv=none; b=fzmJaN0pjvnc+z8B2jvYbf/XDGUmWdO64a8KYqfe9Zzcvju8s0np2WY1J9z7UyV+JjcjxR9ICuFgkdTLvxksCBtzq/6QUJ2d0kNlIoUNu7hU2tNt3HYStL4ILPXS2+tZc75PGiOSCUa2Fcjf0s3Nh55rBEiWul6pNaAF00h8EC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705673438; c=relaxed/simple;
	bh=nHXK0M/RJcCyXcMUGL3CX69X6MS8uSHqxCI8rFn2VmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PPuypJhOls1+4PdmRPKUcJIyfw18xFY2lHFbLsCq54ecTbi2czWqUyzfl5e4fZAITiM1t44hA5frGFFjTQxG5FMa6CZfyfdMkgKLEcZUT+d20CRuw4Yc6/pX6BQjZhFCKTZAPsEVKFu80HXS0xu8ga+hBM791W4IrpGJd5rjOCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uv7CHGWi; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2cdc1af60b2so9108671fa.1
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Jan 2024 06:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705673434; x=1706278234; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nHXK0M/RJcCyXcMUGL3CX69X6MS8uSHqxCI8rFn2VmM=;
        b=Uv7CHGWicR/WsyJvp9agl3vC0H0xBXdFNhE6lyt0O+KoH8YZVLTiC+/XSzyDJev+EW
         3OB68hC/p4ngm1T/pV7JFoHHGA9BZpnkr/KB+fFtqDf+w4BSAkQ78Vkf1o2EjjjN6cvk
         MrUB9YJxWTEOLcJpQG8bvE2/M/+vROgbkJWSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705673434; x=1706278234;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nHXK0M/RJcCyXcMUGL3CX69X6MS8uSHqxCI8rFn2VmM=;
        b=OpEdZqqwZqtuw+I5TzhgVB+lZcNtgAWjvTwkUOxGi625eo+OHVxNZMdLTb9VW1XOJc
         xE1W0ewTBw9ZNM+UF8lJxuCS/pHY2S3hCDdavB67/gPcX6mwt8qoHuQzG5cmS5kPEiJK
         Ffry5hec6Ur5i8avthuwgpaOWYgz+DHOJt5oTGkRGUsEerJpHNmAFZeLAlZXuXLccLue
         0sb7ffQkYXGEy1DQ3aqzH/KKCEaic0ZyLSFRA0FH6NBR/oNVyJ9pK5lyZTkbbT9uQwSi
         78z3n9NNY+UyQpualS23HQD3VAuuRMvXKahD+SKijah1jzZ/a/GQIpE91gXXcnwiEp7M
         /LSA==
X-Gm-Message-State: AOJu0YyOSRFNUsbNlf5ftGQSVMuv/vTWVIWVeib8UZmW2nJSfgmHOhA4
	yLLUdIlZnadevb9+vxAMya8UTLJ92P+Mv13cwhiDYVcpyyeSI751m1DjDqo8VdrmAP2wfoDAax7
	CjaDNB3K5zX20ID77ejYKSrkySt+B7Ksd+ZsH
X-Google-Smtp-Source: AGHT+IEFCjeV0kPn36vLidVc3VqzoEt8h6MuGqJE0fkj1ZsKwfkPt7HEFEvhTaN/u0H5BfClm2yPwTDCwB/jUKb8HV4=
X-Received: by 2002:a2e:3506:0:b0:2cd:2ac6:9685 with SMTP id
 z6-20020a2e3506000000b002cd2ac69685mr1271557ljz.92.1705673434623; Fri, 19 Jan
 2024 06:10:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119084328.3135503-1-lma@chromium.org> <d2329494-2c57-41bb-a9ea-2c9903500d1e@roeck-us.net>
In-Reply-To: <d2329494-2c57-41bb-a9ea-2c9903500d1e@roeck-us.net>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Fri, 19 Jan 2024 15:10:23 +0100
Message-ID: <CAE5UKNrU9YHoCQr8HLFf9-T4-NobQ4jWtryVqq9okFz8nVezgQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Introduce EC-based watchdog
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Radoslaw Biernacki <biernacki@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 1:50=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/19/24 00:43, Lukasz Majczak wrote:
> > Chromeos devices are equipped with the embedded controller (EC)
> > that can be used as a watchdog. The following patches
> > updates the structures and definitions required to
> > communicate with EC-based watchdog and implements the
> > driver itself.
> >
> > The previous version of this patch was sent here:
> > https://patchwork.kernel.org/project/linux-watchdog/list/?series=3D8179=
25
> >
> > Changelog
> > V2->V3:
> > * drop "-drv" from driver name
> > * use format #define<space>NAME<tab>value
> >
>
> I am a bit lost here. You dropped my Reviewed-by: tags, even though
> I specifically said that they applied with those changes made.
> Also, according to the above patch 1/3 was not changed at all.
>
> What else did you change that warrants dropping the tags ?
>
> Guenter
>
The "-drv" change was related to patch 2 and 3, and I have used
"format #define<space>NAME<tab>value" only in patch 3 (as
ec_commands.h is mixing those)
Sorry for dropping your "Reviewed-by" tag :( I've assumed (wrong) that
I cannot take it for granted sending V3.
Alos in such a case if there are changes in patch 2 and 3 and 1
remains untouched shall I send only 2 and 3 in the next version ?

Best regards,
Lukasz

