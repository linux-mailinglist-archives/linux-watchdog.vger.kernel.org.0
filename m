Return-Path: <linux-watchdog+bounces-482-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FC183A02D
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jan 2024 04:38:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 010AD294D42
	for <lists+linux-watchdog@lfdr.de>; Wed, 24 Jan 2024 03:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C5D66FBB;
	Wed, 24 Jan 2024 03:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vAXnxluH"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6C48F72
	for <linux-watchdog@vger.kernel.org>; Wed, 24 Jan 2024 03:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706067498; cv=none; b=jM57zBbRc+sq2p3e6Bqubrlr6DukNL9h8gZhTR44aVvIVqOyh3K1h7CogpmpG+SMt9M+Be+e3FZmk9hVwxzV877/42jeeDzxMYloM1T07ZuOcTTbvPkEF9bO9GP+CTxDdom4ktrOT5M8u7MLCrh9/M67yt3PX7NrrU3pB5FZhmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706067498; c=relaxed/simple;
	bh=gHY6Za4YB2YEjW4eFUsAvZWAPhx8MO1yOAHtuYxr1Y0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GFYBOFmAwvIzXQuMg77ZSrX7Kwt9g25+gjjggiorAxHO8BTvsv3oHB7mOa0eWEjiLPd56HaqVVd5Ygt0UlLsJa9G3EmXR15YbQgs79BXq2kVr+GBSIxt5jpkiy8B1U5QysTRq8TDJJ9NA3A38w+NysShFB/xpH2hraiFt16hCqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vAXnxluH; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-428405a0205so85731cf.1
        for <linux-watchdog@vger.kernel.org>; Tue, 23 Jan 2024 19:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706067493; x=1706672293; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tdMLjM3xmQX96Y3bdJuN/STfPj4rBI4cOGcM5vMcyR8=;
        b=vAXnxluH+jfAw0sZ2evuV3GmDQvMJNJKRDJdorN1jP6pI18KXLY0z2LBRjNzEJ+2Hb
         15LAZpsEAHKz+guokMS2/ZN4NDsUpqp7jRF9fVn9oBXcM1MieQ0GC70TYgyNITA3bxSb
         kJJhdaVzM6pQs+wfcKWbUDuruRxBEbDx3O4E3B9h8x3fkOjG8qIgOZrk5aVUTjyE3M93
         n2BKNEHGBWjmBQ2aH3MnrJDd7mdu5c/YjZPKCaSZ7gQfQE7PD0d1eFXuWbYlZxRN4u0I
         9Ns13MYE6jduQwdeZBYWkUpW2yln/rJbl5dnGNewAorvxzpgo0fMq4ZVE4Thn5opdgPg
         3A6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706067493; x=1706672293;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tdMLjM3xmQX96Y3bdJuN/STfPj4rBI4cOGcM5vMcyR8=;
        b=OIS1N1wYmVp2ua+LT5a01eoaM5e5T7j+nBMroHft3plEhEh1PSBwDWLwr5VMT0qOdq
         CLysAyU+rM/wyRft8by5t9hE8aP3OXpeespo02Y6iak8Id/4re76YBcEUpqQq332iCsL
         ioNPdpo2LStZV3IRVuzPdMjpoaIqwIS0aDeL1KYevYpC9yzrrJHyQkqQIO7qhs2GwFiX
         7We5BQR1ywIHwi9D5PxcmMlneMSgiOgoR0Xzk9W4eTSHM6tw7rDI6k3QxgkJGYJaFajq
         9PUQE2ugPaUXPHmdxMFg4rtcnaZaIQ9r+jOEikYbOW1GSui7JxDlvfAIkD+8NTTOBXY9
         paNw==
X-Gm-Message-State: AOJu0YyBsJ/8AjDIEa+dyNYguLOO+A8Ce64HX006SZdREY0u2Dz6icwi
	kyaXC0bKL1FwjUYmgxeFv4F6PM73YgBiAxzJqPa+JJEzWPJxNSAvQi2Lqh7w4TC8KRb4QcjHiKC
	K+ml1dkpB4OyXLO5nCERjQ7l1CysoriX8nvNn
X-Google-Smtp-Source: AGHT+IE1Esjv9/sVBDPl96cvpbPyXYWnTPZ9UtZldeJovkf65bcpcTqobEEXS2u1smk5x7ftPB0iqtjG//qQwnu2PZY=
X-Received: by 2002:a05:622a:17cf:b0:429:c9cc:daa5 with SMTP id
 u15-20020a05622a17cf00b00429c9ccdaa5mr18599qtk.23.1706067493350; Tue, 23 Jan
 2024 19:38:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
 <20240122225710.1952066-4-peter.griffin@linaro.org> <da30a68a-e29f-45c8-aa73-02955255a457@linaro.org>
 <CADrjBPor5tMY4r0jOy7GH36auCU7dWn6Qn4ct89bsSMW4vAQOA@mail.gmail.com> <6c72a521-1048-42eb-ac74-d8f718a90723@linaro.org>
In-Reply-To: <6c72a521-1048-42eb-ac74-d8f718a90723@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Tue, 23 Jan 2024 19:37:34 -0800
Message-ID: <CAGETcx-CCpaV7R0O0HpDpoX6KxQBuJiMmKdWA8nDE-5Qj2Sa7g@mail.gmail.com>
Subject: Re: [PATCH 3/9] watchdog: s3c2410_wdt: update to use new
 exynos_pmu_*() apis
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, arnd@arndb.de, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux@roeck-us.net, wim@linux-watchdog.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	chanho61.park@samsung.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 23, 2024 at 10:12=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 23/01/2024 18:30, Peter Griffin wrote:
> >>>               dev_warn(wdt->dev, "Couldn't get RST_STAT register\n");
> >>>       else if (rst_stat & BIT(wdt->drv_data->rst_stat_bit))
> >>> @@ -698,14 +699,6 @@ static int s3c2410wdt_probe(struct platform_devi=
ce *pdev)
> >>>       if (ret)
> >>>               return ret;
> >>>
> >>> -     if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> >>> -             wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev->of=
_node,
> >>> -                                             "samsung,syscon-phandle=
");
> >>> -             if (IS_ERR(wdt->pmureg))
> >>> -                     return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
> >>> -                                          "syscon regmap lookup fail=
ed.\n");
> >>
> >>
> >> Continuing topic from the binding: I don't see how you handle probe
> >> deferral, suspend ordering.
> >
> > The current implementation is simply relying on exynos-pmu being
> > postcore_initcall level.
> >
> > I was just looking around for any existing Linux APIs that could be a
> > more robust solution. It looks like
> >
> > of_parse_phandle()
> > and
> > of_find_device_by_node();
> >
> > Are often used to solve this type of probe deferral issue between
> > devices. Is that what you would recommend using? Or is there something
> > even better?
>
> I think you should keep the phandle and then set device link based on
> of_find_device_by_node(). This would actually improve the code, because
> syscon_regmap_lookup_by_phandle() does not create device links.

I kinda agree with this. Just because we no longer use a syscon API to
find the PMU register address doesn't mean the WDT doesn't depend on
the PMU.

However, I think we should move to a generic "syscon" property. Then I
can add support for "syscon" property to fw_devlink and then things
will just work in terms of probe ordering, suspend/resume and also
showing the dependency in DT even if you don't use the syscon APIs.

Side note 1:

I think we really should officially document a generic syscon DT
property similar to how we have a generic "clocks" or "dmas" property.
Then we can have a syscon_get_regmap() that's like so:

struct regmap *syscon_get_regmap(struct device *dev)
{
        return syscon_regmap_lookup_by_phandle(dev->of_node, "syscon");
}

Instead of every device defining its own bespoke DT property to do the
exact same thing. I did a quick "back of the envelope" grep on this
and I get about 143 unique properties just to get the syscon regmap.
$ git grep -A1 syscon_regmap_lookup_by_phandle | grep '"' | sed -e
's/^[^"]*//' -e 's/"[^"]*$/"/' | sort | uniq | wc -l
143

Side note 2:

How are we making sure that it's the exynos-pmu driver that ends up
probing the PMU and not the generic syscon driver? Both of these are
platform drivers. And the exynos PMU device lists both the exynos
compatible string and the syscon property. Is it purely a link order
coincidence?

-Saravana

