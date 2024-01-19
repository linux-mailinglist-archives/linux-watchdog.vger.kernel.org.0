Return-Path: <linux-watchdog+bounces-417-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05C78325CB
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jan 2024 09:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F992835F6
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jan 2024 08:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1720563A5;
	Fri, 19 Jan 2024 08:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WOjv2CZ4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971FEDDDC
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Jan 2024 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705653303; cv=none; b=HS5uwuuS/n1CmLxVg6cxSwTQUIsAe4wC57rkIlCQCCoy+w4XsWIOnskfY5KRFpi3ZY5fsIaQwntRXZXFjeKbgvu2/vZp+nAKbfhP07CuaTjjQULZ5N8dZ2zqtGXVW5CbUFrnasxYWCnAtev8fePswaz9e9bkOIz/8947+sCYaFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705653303; c=relaxed/simple;
	bh=h5PiG7Y3C3wtVijqXyMQ5ULW5o06mfqMjUtDXYxPOz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fB5tFYNQPzQlUyJYjPHXWqt1JigPIfFBqAJpYgO16gXHAKloXNCsAAqGx2gkWBtE5rTh1kB2Ma6Bi4+KehyPP+mG3MyTZI7DPnu/1jrddUlp2H21aeEY/kQ3acX45M0JMSrxNH43xneBkLyP/Y43hbefkudHhwVQfT/TQ+IYHlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WOjv2CZ4; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2cdeb808889so6106431fa.3
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Jan 2024 00:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705653299; x=1706258099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SazaNZvt6lGiurJ58Mpk9uqodPXR3M0NpSG4gQw9/io=;
        b=WOjv2CZ4Opea+xlx64Ag1YPS2Z7KQnPTE97QDYPtAdYFJgHPBCSL3xdT4AEctaw3Ic
         DUiw70stlPxQ5dpZj5tSCRkSdQoyt9N9zWYE57F1kLasjosPa+QuS6kquEbV829cAcMH
         PRlhslx8H8ug3mGZCrNFs0ug19v3dYzBzaJ+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705653299; x=1706258099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SazaNZvt6lGiurJ58Mpk9uqodPXR3M0NpSG4gQw9/io=;
        b=oFfUJcUjHfQdz0VDDvCNcljeaRMEVD76V+NPPJRcqpKOxUuLRPrNLONSJrHhgvl8Yh
         yq9Iy6oJ9PIjVJQlfh6jBcjPlvcdakZ98XjiJOTIx4OZC8Z8UR7K2MJDaLplqceRh8aK
         lODmDqiFcMBWnp4GHg+Z9butsLJSD9G4MTxzWGlsSL5WBBWvXjD4/D9SYosKbaw3LVsh
         SV2bL1bsM0EAaf64GHxIqSxcZm25f5PhIeLnZ4Tq+KFSlcDfdjEx3XqfQRDdmXUS0z2K
         o1Jga02FFbUS/USYckz1w7c8GAcBvom5LRxwU7NaQoEUo3tEUTbvcQ3w8LrjBQWR90Ly
         gwWw==
X-Gm-Message-State: AOJu0YyznuUyBS/0fAsoBMOV5sasvtbfvxC8uDCEDTgTi3OjkVQD2+LI
	TqRY10nyj0IMuW8Q9Q0PMj2HgNxh8Yw2oQ37iMsa19HjWBZyvobgT6oicdG1/BdYyT3uH1Q9lK8
	bQg3fcqE6P6q53oIrqlUQsYz+PUvicAqClBFw
X-Google-Smtp-Source: AGHT+IHumnjC8v2ZVnJ4jI370OjVCVyQIbL03dj526jJ2a1saWl50XX/H3mQqM2tG/aYTwIxewEYydTL+1hGMBgUPkM=
X-Received: by 2002:a05:651c:1a11:b0:2cc:fd12:40ea with SMTP id
 by17-20020a05651c1a1100b002ccfd1240eamr1651789ljb.42.1705653299491; Fri, 19
 Jan 2024 00:34:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240118195325.2964918-1-lma@chromium.org> <20240118195325.2964918-2-lma@chromium.org>
 <ZanvffnDDoT0j2af@google.com>
In-Reply-To: <ZanvffnDDoT0j2af@google.com>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Fri, 19 Jan 2024 09:34:48 +0100
Message-ID: <CAE5UKNqa8kbcjNmWb4=m4tLJJKStUaYYP1OMVkqr2T3Xgdz_MA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] platform/chrome: Update binary interface for
 EC-based watchdog
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Gwendal Grignou <gwendal@chromium.org>, Radoslaw Biernacki <biernacki@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Lee Jones <lee@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2024 at 4:41=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jan 18, 2024 at 07:53:22PM +0000, Lukasz Majczak wrote:
> > +#define EC_HANG_DETECT_MIN_TIMEOUT 5
> > +#define EC_HANG_DETECT_MAX_TIMEOUT 65535
>
> EC_HANG_DETECT_MAX_TIMEOUT isn't in the latest ec_commands.h [1].  Could =
you
> either add EC_HANG_DETECT_MAX_TIMEOUT to ec_commands.h or drop the macro =
here?
>
> [1] https://crrev.com/5a76e67210b15fcf67d8a6f90439993598949ae4/include/ec=
_commands.h#4749

Yes, I will update ec_commands.h on the EC-side to match above
definitions although it doesn't influence any logic on the EC side.

Best regards
Lukasz

