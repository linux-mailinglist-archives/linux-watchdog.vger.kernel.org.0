Return-Path: <linux-watchdog+bounces-4643-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CB305C8F779
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Nov 2025 17:13:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B94BC4E620D
	for <lists+linux-watchdog@lfdr.de>; Thu, 27 Nov 2025 16:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DF83376A2;
	Thu, 27 Nov 2025 16:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ILUboCil"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432A334C08
	for <linux-watchdog@vger.kernel.org>; Thu, 27 Nov 2025 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764259991; cv=none; b=gdwh9Zo+8jTlV89ZLrsZcTz0Anr+gco6qPF1knXRxZNIWGTZ6PcuuKr0Am3/dHqm+n/pGGq04U6sdqGiYs5O35pyMtLK3vnzzhyfU73fAXXQWNIuOAy2dN3Zf8DjiZ5bKIXTeXnGqN0KEmMz6WifTM/5P6alC37jVJ4X/a1QBhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764259991; c=relaxed/simple;
	bh=vHkgE8J7FmhstuADR1oxca5gWYlZxfEf1EiRPemtMDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tix/C4tltrGH9J59ttZ2UueBm096xN9SiEUOyQlaCqKAYmaGaXdjsYncB0yoTG0E+5YKE3lr2t15RVcWADpOfT3sQSyL74AvTcNliI60FGvN8ur6Rhq3OhNG7VrR9VoLt00xDU2EoX/Cly+G3AMah57H+FcUaft2KuF9ndyDMzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ILUboCil; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b713c7096f9so161652666b.3
        for <linux-watchdog@vger.kernel.org>; Thu, 27 Nov 2025 08:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764259986; x=1764864786; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vHkgE8J7FmhstuADR1oxca5gWYlZxfEf1EiRPemtMDo=;
        b=ILUboCilhRu7W2l5uL+twL13aTtqP0MhjgKRRx2EMIflWnKm2tTIgbXCp9YjNKx4uu
         UsKxTeNgyxoxqMXz3Cf64Of7brK0+IiX8CjgvisY2mcFDpRTG2JO2Le9mJDH3klbrY5N
         C/OCOysbYHIDDRPNHlyvUxA0eu+ypLJ3qSI0cw3KEbK3SzDI9oRyX9AvAq4QGNRy+d0K
         A1XUYALNm8gGVaBIqY93OILPgJ06q2xrQDn/ZR5NDnlmBPM2gk+t8BFZQI3+vNP+GF+B
         LdNWFf+5jS1NyT8YJ4G6rJmQd1u6PAQeU5jrjouOzp+aQCxDSNr8Q9J9Nj42mPRCY+rn
         HFgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764259986; x=1764864786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vHkgE8J7FmhstuADR1oxca5gWYlZxfEf1EiRPemtMDo=;
        b=McRP6H6KlxiMyFiQjRG6mbnaxL3TNCSf9c8E67zAVFw9axXTi4ZnxLKigcKHaDHl7j
         NQ480D3oF2b4CHZQNFwitAdPdw2/4mhdfgc5f88WVfTcw4FZYspjbNgKlgEpYBpQQv8f
         EWGH/uf+VqlWX1ig/jRnS1zGfpWtV6Sepdy2rwdHAmuJBiKF36HZRsbJH1olLcrX4scZ
         vnoe3wfGXAZWhCHtGEO9GuoCLTJqINy79Cpx2iUtjjJMhVjG3jqZ3n46/vIrSL6MzWBj
         oPTrIlkVzELZhWuSUF2GIeyS4CG7pybvRM4WH+Wz3TtxsDQKK20xlD+k+HmgCQH1Aeor
         iN4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/NR98m/EwF4YRLcP/Fmt63pV3ke+HWfrEM2Amm5MMjsTVCvNlQaRu991tgOcc2ZiN2no1jfWHK/HRl+dEQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUIk4dhdZOjQiWxo/l8YEjLpWyvzoDA7PcEXmDqpPCddiuQGad
	InJc3TfIVpNEosbqVK56NcCkPeD/lQysPSU8bDq/c53sThR6B2a8soMW9UQEOlp2iFyOqbJLArR
	b/cknb8iXWau3ZTFA+V6UmWhn54RDTYY=
X-Gm-Gg: ASbGncvRaXIgIhAVn1TKyvLkvfBKSu9N/Eb7qMeZGXUOLbBGEOSXS1QqwLnv7PM9aAp
	IdOuc3OwrR5lcUXKNyAs3TOXjj83JBpyhLNVX03vWOzBU+QTzpMUvXYvhju9fVylMfUyKZ+XibT
	JDXOqaMuX57l0s5ypBQhfNDLuLi55ehRQV4vXW7wZXOiPJKkP+OnG6XLOX3BQNemmoVWC6XXB8m
	2fzo2dKnqzr/rvUYe/0bHihcwwE6O9gQDRTSdnhuVJN84RLqadgrTf6NLHvNA1OIOr9+gmTjxqU
	Cy8V++kcAc9HgpzSvoL54OcngWNAqLw8EtffilW9N6zdMbDH19SHYsjiAezPG0f56SW+/OI=
X-Google-Smtp-Source: AGHT+IHL5lD9l+Hh164xtP764PC1ElejfIHOpAawihP6o7z5n7+TtXrvPC3UUFXr2PXT/YoRMV/DR5xhbgT7VKwIfhk=
X-Received: by 2002:a17:907:d05:b0:b73:7ca6:220d with SMTP id
 a640c23a62f3a-b7671a4728bmr2613030766b.59.1764259985521; Thu, 27 Nov 2025
 08:13:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251127155452.42660-1-dev-josejavier.rodriguez@duagon.com> <20251127155452.42660-3-dev-josejavier.rodriguez@duagon.com>
In-Reply-To: <20251127155452.42660-3-dev-josejavier.rodriguez@duagon.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 27 Nov 2025 18:12:29 +0200
X-Gm-Features: AWmQ_bl-vjVNPE1-lBZUlM8SQoQAsmh5XSIjD1Lm2LJMWJiupqb_fmgKaxReBWs
Message-ID: <CAHp75VfhM5GuYY1qUKgBhePDo4oe5k3K1ZDTPbYJNr5NtjVVfQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] mcb: Remove MODULE_ALIAS from all mcb client drivers
To: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
Cc: linus.walleij@linaro.org, brgl@kernel.org, jic23@kernel.org, 
	dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, morbidrsa@gmail.com, 
	jth@kernel.org, wim@linux-watchdog.org, linux@roeck-us.net, nathan@kernel.org, 
	nsc@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Jorge Sanjuan Garcia <dev-jorge.sanjuangarcia@duagon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 27, 2025 at 5:56=E2=80=AFPM Jose Javier Rodriguez Barbarin
<dev-josejavier.rodriguez@duagon.com> wrote:
>
> MODULE_ALIAS information is no longer needed as now all mcb client
> drivers are reporting such information through MODULE_DEVICE_TABLE.

While this is not a big change, I still would recommend to split on
per-driver basis, and with pushing the first one as kinda a fix after
v6.19-rc1 (to v6.19-rcX) allows other maintainers to apply the rest on
driver-basis. This helps everybody I assume.


--=20
With Best Regards,
Andy Shevchenko

