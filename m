Return-Path: <linux-watchdog+bounces-428-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 094D4832BA4
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jan 2024 15:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B2811C2297A
	for <lists+linux-watchdog@lfdr.de>; Fri, 19 Jan 2024 14:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFE0B53E05;
	Fri, 19 Jan 2024 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GEXYFh3w"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249CC537EA
	for <linux-watchdog@vger.kernel.org>; Fri, 19 Jan 2024 14:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705675843; cv=none; b=hkWwy6hkhqyNGWCR08mrqkd2EkLa3/QIARz3dg8Wr/+yIBFGjuhHbvNdlaTE9fznHZs1NPv7OLXDfnpBK2e0hRzWhJGprC8sJdc7WYH8KaiZkKK0G3+UM8NvvfAVjjZB6i8ao7qEoOUSyjTAMZRBY/fA82zaduNQapXtExpIcsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705675843; c=relaxed/simple;
	bh=xwoZxI275/To70YZy7/2EL0Bm3UA5vkR9ZSvms7w7kg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HRDziAz74A0pPiPoMVq80wj3K0/mwyKEntZoOv1rqHRE8s03LlfC6ROPlzvvmLp8G9L1Zhc+E4fcN3PWkv8IOJ1r1Z/1aMLkHZ8/3nHVwEkKKbynyhRTMwlKXXynALmHPoEv43DQXtaQ0wKFwGUO/YR0uBfF6ln2gXAS2wocn/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GEXYFh3w; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ccb4adbffbso10480311fa.0
        for <linux-watchdog@vger.kernel.org>; Fri, 19 Jan 2024 06:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705675840; x=1706280640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V12/jbF4jIzNWrp077wLTVh0cToW9uUJVCHOyKjvBFY=;
        b=GEXYFh3w6L+ZvnIQGJc1coElV1ZOn0P7d9hrJL6zPdflwxXTFY14ocVvqq0BBfn+IO
         TecBgowW2HODS3CNxWvS3dul0bdeLM6PD14u+KonWbsGfThRbYEc3bwX2WwF30yrkK8l
         l1L6Wng2ndWIH70uTr4gZ2m8r1RrlOlXpmD2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705675840; x=1706280640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V12/jbF4jIzNWrp077wLTVh0cToW9uUJVCHOyKjvBFY=;
        b=M7qmspQDSK6dFzyGKnknhlhfD8bSIcYVySWAr4BwY6ovrRJnLLnPvlU5lKZa3yl6XM
         /12iydxv8OYnA5131/M6RuTUeqv4Fh1ahtClC2oBParweSNlzLSo1tg8YOMgVoJiGV8u
         hs7mMHMgdyQA+GTPPTdyU0VVgfBm6/wecJne2ra7Y3IMnjKNsPrUDnnnRn453LrI0tta
         z69UO3yQKZG09LqTcMFnDW/Y+5McYjlCoVD/t6nbNIsQ2+nEYNCo9/H8vAaw0rRU0X9j
         6lVmOBJNzsu+ba0BPpqpsTGr8kO+Hkusz93azVV9VgurJdFO/wu5DDAzHMVYqCd2iEvk
         k+Hw==
X-Gm-Message-State: AOJu0Yx74ONy5PZfr7En+vFVz4S/LzQzwLa3K9pYa5uIRAUwneMcQ93q
	VtdjRvvE/m5pGp1dVE+THHRw2sIFTv7hDxsSUsSt5OEHrCdkVVWBpcr9YwX4khf8iv+bhg9+oSK
	aGORsD4LjUj/dJjLOVeVlfBVU5x6VfRZMAuzv
X-Google-Smtp-Source: AGHT+IEH73vRz4SgGHZs9TuhJC0z+cpuBSlZovW/NmW8yw3ZvTrIcxh08D3tt5qoPVhNMiGL88Dec0EKLhJ85Vmgkk8=
X-Received: by 2002:a2e:2a45:0:b0:2cc:7575:edf9 with SMTP id
 q66-20020a2e2a45000000b002cc7575edf9mr1475021ljq.91.1705675840226; Fri, 19
 Jan 2024 06:50:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240119084328.3135503-1-lma@chromium.org> <d2329494-2c57-41bb-a9ea-2c9903500d1e@roeck-us.net>
 <CAE5UKNrU9YHoCQr8HLFf9-T4-NobQ4jWtryVqq9okFz8nVezgQ@mail.gmail.com> <b65b46a7-c65d-49bc-a5ce-5085da2fc112@roeck-us.net>
In-Reply-To: <b65b46a7-c65d-49bc-a5ce-5085da2fc112@roeck-us.net>
From: =?UTF-8?Q?=C5=81ukasz_Majczak?= <lma@chromium.org>
Date: Fri, 19 Jan 2024 15:50:29 +0100
Message-ID: <CAE5UKNqM6t+nzY-68pVBFxT-_TCjMjDUE-GwRgXp9ny3vqP-1A@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Introduce EC-based watchdog
To: Guenter Roeck <linux@roeck-us.net>
Cc: Gwendal Grignou <gwendal@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Radoslaw Biernacki <biernacki@google.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Gunter,

I'm sorry for the confusion, I've just forgotten to add "received-by"
and there are no other changes besides mentioned in the cover letter
changelog.
Thank you for mentioning the process, now I understand why it is so importa=
nt.

I will send V4 for the sake of following the process.

Best regards,
Lukasz

On Fri, Jan 19, 2024 at 3:43=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 1/19/24 06:10, =C5=81ukasz Majczak wrote:
> > On Fri, Jan 19, 2024 at 1:50=E2=80=AFPM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> On 1/19/24 00:43, Lukasz Majczak wrote:
> >>> Chromeos devices are equipped with the embedded controller (EC)
> >>> that can be used as a watchdog. The following patches
> >>> updates the structures and definitions required to
> >>> communicate with EC-based watchdog and implements the
> >>> driver itself.
> >>>
> >>> The previous version of this patch was sent here:
> >>> https://patchwork.kernel.org/project/linux-watchdog/list/?series=3D81=
7925
> >>>
> >>> Changelog
> >>> V2->V3:
> >>> * drop "-drv" from driver name
> >>> * use format #define<space>NAME<tab>value
> >>>
> >>
> >> I am a bit lost here. You dropped my Reviewed-by: tags, even though
> >> I specifically said that they applied with those changes made.
> >> Also, according to the above patch 1/3 was not changed at all.
> >>
> >> What else did you change that warrants dropping the tags ?
> >>
> >> Guenter
> >>
> > The "-drv" change was related to patch 2 and 3, and I have used
> > "format #define<space>NAME<tab>value" only in patch 3 (as
> > ec_commands.h is mixing those)
> > Sorry for dropping your "Reviewed-by" tag :( I've assumed (wrong) that
> > I cannot take it for granted sending V3.
>
>  From Documentation/process/submitting-patches.rst:
>
> Both Tested-by and Reviewed-by tags, once received on mailing list from t=
ester
> or reviewer, should be added by author to the applicable patches when sen=
ding
> next versions.  However if the patch has changed substantially in followi=
ng
> version, these tags might not be applicable anymore and thus should be re=
moved.
> Usually removal of someone's Tested-by or Reviewed-by tags should be ment=
ioned
> in the patch changelog (after the '---' separator).
>
> > Alos in such a case if there are changes in patch 2 and 3 and 1
> > remains untouched shall I send only 2 and 3 in the next version ?
> >
>
> Again, from Documentation/process/submitting-patches.rst:
>
> ... the patch (series) and its description should be self-contained.
> This benefits both the maintainers and reviewers.  Some reviewers
> probably didn't even receive earlier versions of the patch.
>
> Note that the same document also says:
>
> Wait for a minimum of one week before resubmitting or pinging reviewers
> - possibly longer during busy times like merge windows.
>
> I could just send another series of Reviewed-by: tags, but quite frankly
> by now I am wary that you might drop those again, so I guess I'll wait
> a while to see if there is another version of the series.
>
> Guenter
>

