Return-Path: <linux-watchdog+bounces-1656-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB97596833B
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 11:31:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87810281ED1
	for <lists+linux-watchdog@lfdr.de>; Mon,  2 Sep 2024 09:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C8181CB15E;
	Mon,  2 Sep 2024 09:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lCNqfS4R"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACB21CB141;
	Mon,  2 Sep 2024 09:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725269475; cv=none; b=fTj/YcS5wJsjFaBUeNdByfCjOnfDnPaT480OFMX4rzpf4jrTCSIw74oI/vKI2Zj5/Dm7anTnPLCgHuKn++OPBJzuvrEfvbhdmqcFbvQPXSLDPKoo6UmxYMdLNBwqHmJWMsiCpPtxCPjxiMJmXl/0Ephj4JLadiSzt+xPS0QUE9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725269475; c=relaxed/simple;
	bh=r5MW5PY0BX4HTs38TjiI+t8lh33g9xwQvJURxH5kZ9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWMwjU9I0UXVx1L4Hk2om7gTM1x++4EhL+nEf4tTcXTDL3iuGxLrnNd/EY/CmlEueVVbNQMk/1pvPYrPIehXx5Cyg+Y+VFpaZg/eLi6PifFyTXjhYKLEEprv4Cy0fmZMlJ6PU0koI9gS4ivMMM9V3T8OkheEWmmHCvgOelBLVO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lCNqfS4R; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a8692bbec79so448951766b.3;
        Mon, 02 Sep 2024 02:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725269472; x=1725874272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5MW5PY0BX4HTs38TjiI+t8lh33g9xwQvJURxH5kZ9g=;
        b=lCNqfS4RDeMkiLuTPFpzGiQZsIEJvLr6PyLTaakv2B3yoZV+Qgu0bD8p6a0TMIH8Rf
         gw6LmX0twq2iX2CYxS2vG3BNXIT6zPgViX0WCVh7T7Ge+Z2spliHUVhlnIC9sN216MiL
         5w6q4Y6i9fQ9SpWenYlP8kBJoI8r/c5yl1LLEvI2H2gE5/eReHpgTpKtrga9SriOieEe
         gtaiO0zhOfbCKqP4t7a55CSOuPsOivbqWgC0YSLUb/fjl7b5MlE4XORuNP4fS3xwG5VW
         vxqeM47ExJiOSw4jRZfCjKdOLC+qgtsKlV6LmnBiOH3JB9ReyvjTK47TA8Dc4ywAJzE+
         DskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725269472; x=1725874272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5MW5PY0BX4HTs38TjiI+t8lh33g9xwQvJURxH5kZ9g=;
        b=qbn8TVAVlwL+PNGK9u/AeXLjcYOQrNk7cXOCuhHQsmRDXKGfKbsk+K7kUY78uGlKNY
         1V5Vpysm5rjPahNu/TKMqxC2F5hgUn3JqIDjgoo7U+DzgUXKBkR9qhh/ichwSLoL9QuT
         swmq5F+rQtaYb3lmNe7rpdRWtD08i0j7abgOYbaayTvqIX8AkBU12vKABI9ryqUVcVPd
         +clG9m4zXKj3B/4nS47FAJAa7tmh3tYtMpfnCj36ClPaoxcipAmsRJMZqQHjrU6hzn5V
         J5B2DY+aop3GftUu1AwU+oRSOBLrzwFBdno8BJyJrxWKqMWu+dvpidX8YfcQNZ/7ZPiR
         hXiw==
X-Forwarded-Encrypted: i=1; AJvYcCUjn1U15WFsuoPhZ76Du0inBemQ1wk8q+n7e/Qg8JN10/KNJ4qJikjLdGlCz9wNR8foIFk0gF1hjuHat4k=@vger.kernel.org, AJvYcCXtug3TGoOchd2kY4gnE8PpumCA3MvQdGR2mBX0si9TAsc09UD8JbMsxO4FeY88egn5NkBWDbCfuKIP0oUIaWM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPCP+QhTvWtE+Qs7DQHtVejBnLxsN5RSRB3+JfzhuhvQ9jQcjo
	TV8GUjYFl4bI1Qdd3GJtUXsterS6ThPH21c8ZuijUuk9h9TVDtHC2lP+Z3OmIgTvHYVOz1iGIa6
	E+xQWtQOGdr3z7GZgkE5jGxKdsLg=
X-Google-Smtp-Source: AGHT+IGKbD0zfJ85xo2o/MQtjgTRu7OcooQri+CeFA1n49e6BKbDHZE7M0RbFgAdMWXv143DsKXU4iaNhOX42fyQM50=
X-Received: by 2002:a17:907:7248:b0:a86:7c6f:7cfa with SMTP id
 a640c23a62f3a-a89a36a2db4mr614001266b.37.1725269471767; Mon, 02 Sep 2024
 02:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240902081051.3824822-1-nichen@iscas.ac.cn>
In-Reply-To: <20240902081051.3824822-1-nichen@iscas.ac.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 2 Sep 2024 12:30:35 +0300
Message-ID: <CAHp75Vcr69b1Jj1hPQJrDu7bbDCdihAJRM9MDLEUKB8JUbYcBg@mail.gmail.com>
Subject: Re: [PATCH] watchdog: iTCO_wdt: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 11:11=E2=80=AFAM Chen Ni <nichen@iscas.ac.cn> wrote:
>
> Replace a comma between expression statements by a semicolon.
>
> Fixes: ce1b95ca23c1 ("watchdog: iTCO_wdt: Use allocated data structures")

Dunno if it deserves Fixes tag, otherwise
Reviewed-by: Andy Shevchenko <andy@kernel.org>

> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

--=20
With Best Regards,
Andy Shevchenko

