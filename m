Return-Path: <linux-watchdog+bounces-1191-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 423BB91863C
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Jun 2024 17:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB5491F21CB9
	for <lists+linux-watchdog@lfdr.de>; Wed, 26 Jun 2024 15:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C8718A92C;
	Wed, 26 Jun 2024 15:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ONu2HtKR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59ACD18A923
	for <linux-watchdog@vger.kernel.org>; Wed, 26 Jun 2024 15:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417032; cv=none; b=ekD/ixdLim5gWEiY8qcUmtcN5Yf6ADj3DfG4QheEZQ3V1/8ZD7z9U8yxIlm0PwZXl8mzrLoxkivDo/zHB1hmhQQXb+XMMBQTgdxG82kVf03qH0Dj6OE4aMjdhCU+7g7viGNKZdTuDSnQGgzRnWBmZZyWf+reHjJ0gz7bwBAzuoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417032; c=relaxed/simple;
	bh=37ZNP33e8+7HO0gnq2NbaftX9ElKyKSPmZLHZYCftzA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CJpgKGnei2WOrRM5c4kcIh0P9Of1C10tpwQBlMt9NhWcRfGSHs5++qG0jKYhC6PQZ76Fqxx1GWS2IfPTtoUUbeNzSz+Pzr8A6tHHKta7HK7HWsrBlA+WDWOAi2xn2dgEtdruaQRDjLJEuZpIaDE4hLPZi4YxCXPGF9HDxyaGtc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ONu2HtKR; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a70c0349b64so456722566b.1
        for <linux-watchdog@vger.kernel.org>; Wed, 26 Jun 2024 08:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719417028; x=1720021828; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uzAm2VJPpaiV1Xbr7cm5GnjinWJJrnRXltU4y23jQs4=;
        b=ONu2HtKRBvxqmOD2z6rypEJiVJrI6H0sonuOSzZB5pXn7J1h1f8vSMHhvR30NOKbsl
         wdLDLhvWamIUk9BEX4MSp6rU+uPkQlvJf6miHAEeR8IRzA1R4P/qVd5INgaQLQSklg82
         yTzjbyhdjyn3jz7uAghvLAK/dq/udBrqilLFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417028; x=1720021828;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzAm2VJPpaiV1Xbr7cm5GnjinWJJrnRXltU4y23jQs4=;
        b=FgECTo/UliLpwg0zyPwZ3iP92cyrw08wfZxrU2symUNTGidrmM5YeMDmVkG5+mBcEV
         RfnXwvm6D1I4COmNb+BFJfrchhhoCqewTkDZ8Py3/UNAgbYQxRTVySRgQJxg/4OmT+Uc
         s7AWioqGkfmjUNxyGnHf5ivovIhQT1rP2QHZ/yS7r9IVGGvmkAUeyCN3H20QJGWd386z
         RJkWnO35YAR0yDgsS1H5jY3qXcTHnCqgvMoPRdBIALX24qMbWNSDgDZETqNIqldRgOIJ
         7FAjovIfJs6Z1t84Q0H/oO8SGb5/0hjg3CZj8bGptPvfVoyY2hQzBSXU23xeuPaWicty
         z0sQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMWb5ujVg/MntFYeV9t6zoC8z/EeLrW9aTAPTQAw/fRTL/qXM0+eEl9G+2C6c8y36Lpvle8vNsaaO6aOSg0AD+Abu/DLxuLUMYYvpD5fM=
X-Gm-Message-State: AOJu0YyHzttfpyV6i6iGdXJkSQciP/dqPqao8TmoRv/IwcE9CN+zktFr
	QJQkoEXlRxDXs2iYsaYVvi3EFh8JmnLswg9Mfa7XAFF2AcvwD6K4Gkav4OEtIJ8t72n9cvcog2z
	uwm5jSg==
X-Google-Smtp-Source: AGHT+IH82voA89rekKLNd8PUoQn2yqo3WSzrmTFpqGNBZABJcRpzaZOV8US4n9SQjn0vTE1dqSnIfA==
X-Received: by 2002:a17:906:2503:b0:a6e:a97c:fc9a with SMTP id a640c23a62f3a-a714d72effamr767565266b.8.1719417028495;
        Wed, 26 Jun 2024 08:50:28 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a728dabd1aesm62323966b.110.2024.06.26.08.50.27
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 08:50:27 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a72517e6225so501341066b.0
        for <linux-watchdog@vger.kernel.org>; Wed, 26 Jun 2024 08:50:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxMvSc4GrgfA00waX8DcfWLANUS7d+v4u+r34Qt5tixgk5gaeWSO9IpkqaSXRKwfpHamwklkYPUEbs6TCUCURutwEwrGxsMOuFGMu7Ewc=
X-Received: by 2002:a17:906:c009:b0:a6f:af31:6e7 with SMTP id
 a640c23a62f3a-a715f94b0f4mr797666866b.32.1719417026789; Wed, 26 Jun 2024
 08:50:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625133151.GA1554@www.linux-watchdog.org>
In-Reply-To: <20240625133151.GA1554@www.linux-watchdog.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 26 Jun 2024 08:50:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=whgnEuO1+8Gk3AiWeuSeAuCoUWnkuxUvczHwfJL+juAsA@mail.gmail.com>
Message-ID: <CAHk-=whgnEuO1+8Gk3AiWeuSeAuCoUWnkuxUvczHwfJL+juAsA@mail.gmail.com>
Subject: Re: [GIT PULL REQUEST] watchdog - v6.10 release cycle (fixes).
To: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, 
	Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Arnd Bergmann <arnd@arndb.de>, Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Jun 2024 at 06:51, Wim Van Sebroeck <wim@linux-watchdog.org> wrote:
>
>   git://www.linux-watchdog.org/linux-watchdog.git linux-watchdog-6.10-rc-fixes

ENOSUCHTAG.

I do see the commit you mention in HEAD, but there's no actual signed
tag referencing it.

Forgot to push out (and then didn't react to the error messages that
git request-pull gave you)?

             Linus

