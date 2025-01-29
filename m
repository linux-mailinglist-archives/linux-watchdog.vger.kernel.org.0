Return-Path: <linux-watchdog+bounces-2801-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B86B4A22000
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 16:09:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D2F3168212
	for <lists+linux-watchdog@lfdr.de>; Wed, 29 Jan 2025 15:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD5581BD9E6;
	Wed, 29 Jan 2025 15:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBcMImWb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EDC1DDC1F;
	Wed, 29 Jan 2025 15:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738163381; cv=none; b=N0zOFmRbDE2X3FcliQS1SQu9OcAUiJ53v/G0mApP8PeHiXwzo5JynBgyydD2eVaomLRY48XpBevldVd3jN9aavvXR8a8aSzjFYv+tvNiCem105Oecp/KK6liEdgDhoURYlOLMevbq+uqx+ft1Cp/3+0eywqeoTXUv1lfPeE85sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738163381; c=relaxed/simple;
	bh=mD3IbhvnzWkioZMR1rR2RpQuziYNJPm6/+wgnk7AAow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gw7Dy0fQ7aQVHFgZVLFtJr7zPT5KsXgixRUVTtRuaYmZrUTisqXMXRqNEFryQMPh/b/2z13I1M7hJMkWyTMBfH9BlmzrVDXuLncdDLCZ2WoREAJpazvOVFwijoGcFhLXDcSXmmCjkfC+y9d8uF63NDKqEoFMD2Rc9AbFddyfmb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBcMImWb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30616d71bb0so70511241fa.3;
        Wed, 29 Jan 2025 07:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738163378; x=1738768178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mD3IbhvnzWkioZMR1rR2RpQuziYNJPm6/+wgnk7AAow=;
        b=RBcMImWbEHXXXPLW2RpjH0RFZbCjTsfRP4YzR15b0LzLfmnlOwdm/4vPBHp+ixnFxj
         AsVSDeMDCUtd/IGhwsA9CYN1GbIW6wx2Cg2jWV6pom5lvUAa6SJW6XFsW77s+NBSMQKW
         oOpJLD7akuaBAnnoMMj2zLDkJIzUTQfOuM1vkQyyZI2Zn7Tew+YtiHEWdthkIqbyQFW8
         w7j1qmrEOxgRpBLrtqzLS+Jvz4B7R0eQEu3m0bY8xMs+o/jpIY+tRQFygPw6BudKZcIO
         Rzq8slrF8jXN4LlAx+DK+tOmMWWam1h5zZGAR4NN0besow0eSkaAWtezapYzNFFzSaO4
         cBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738163378; x=1738768178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mD3IbhvnzWkioZMR1rR2RpQuziYNJPm6/+wgnk7AAow=;
        b=nv+ES7HqwOeTBxzssPRjQULuxNkA25+bkP0gFDvqBqa5QhHEpR/PKWUiLBlZ+q42Pu
         GAGDqjTShbOG9UqrCiKKr2RnJUjkkXlgaUsXG1vzxogMqjiO7HzGx83oP9vueWwvpXVs
         MTyNCJReFRD65jnblvP4AkXMWz9nuK006aQp7vsJdyQeuezd3dPWz7AkaL+go/GVxnCp
         tmgvRHfVRPkCowErX5kDfzZfldp1gcG6P7DAoBS6oeeaTg+JA3BSbInOTBysz97NRQku
         DMjL6VcxSecIVOrBB1Iw/TfoqEPHCYJC4y3zVFfc98Jsvi6cuBUdbRFS6Ud29dJP5e0w
         Hplg==
X-Forwarded-Encrypted: i=1; AJvYcCUnOAEsa8v3xJwBawWezQaUoqE53GrOgMyHylHxzXwn5aNj0ygzcwKavB2L2r73/9m+YDhKYEh0Dx3SCc8=@vger.kernel.org, AJvYcCWPJ4yjDEqkpCY8bq16rtA72rujVfXx7WI0RPNEGjsnEgWHzlwgUm3sAEf/QokYg7blgEMdH/fOKWsnQJNbLQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvKOO4ZGwjNMZg+Rp3ZNVxYuoQIBImZD/BO688Ayyn0lcZ/3Q1
	G4gEXxUZ7R8XOBHoHxJkNWJ8/sqDzxBxdzIs4WtuHE5bOsRGsmOf
X-Gm-Gg: ASbGncvdV/waO+qtRIgLvTAW8ZxpvqvvFxmTHAWKKuMFZLBTB6i9X+oYyp/yhzwU109
	XuzJx8RY2+aEN2qsiA2VTyTYuPwnNbOWyI8666gQ3AJeIq3gLj/13LHMXJvMhueN2/twsJpYnyl
	Dkop0l+8K+lGQchSmtC2WixkUoX5cZBRdgF4DdujmhI4S7p1Co+mDbQ2Q1CR1GV8t5FyOEzmqCC
	I+AJltTeZIjAgLsOLYPnfGrBNtHjtpu++8NLi5JpJ8bJptz4fP+xY0Tail4oiIyRtIZoHzAYPwH
	2U/Hk28stbn8aISXrA74rVSKnzqzU+C0hjwYgPSO9mC7z7FHzIhi
X-Google-Smtp-Source: AGHT+IFIJY8unosxJA34NgIfJRRGE3tO9BAFCjnPkH+yZtbF4tUFs2FcrOxRAJ0ThtIM0Rgxe+Xg5w==
X-Received: by 2002:a05:651c:2104:b0:2ff:c3d2:b0ab with SMTP id 38308e7fff4ca-307968e0065mr10389591fa.29.1738163377330;
        Wed, 29 Jan 2025 07:09:37 -0800 (PST)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076ba6bd89sm22534951fa.5.2025.01.29.07.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:09:35 -0800 (PST)
Date: Wed, 29 Jan 2025 16:09:32 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	Marcus Folkesson <marcus.folkesson@combitech.com>
Subject: Re: [PATCH] watchdog: da9052_wdt: respect TWDMIN
Message-ID: <Z5pErC3d7AqTq3z9@gmail.com>
References: <20250129-da9052-v1-1-aa0dfc2ad595@gmail.com>
 <56d8a231-3af7-4e12-a08b-f7faa549c96a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2q1nT7SaNg0lW3uu"
Content-Disposition: inline
In-Reply-To: <56d8a231-3af7-4e12-a08b-f7faa549c96a@roeck-us.net>


--2q1nT7SaNg0lW3uu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Jan 29, 2025 at 06:48:04AM -0800, Guenter Roeck wrote:
> On 1/29/25 01:24, Marcus Folkesson wrote:
> > From: Marcus Folkesson <marcus.folkesson@combitech.com>
> >=20
> > We have to wait at least the minimium time for the watchdog window
> > (TWDMIN) before writings to the wdt register after the
> > watchdog is activated.
> > Otherwise the chip will assert TWD_ERROR and power down to reset mode.
> >=20
>=20
> This is missing a key explanation:
>=20
> Why does setting @min_hw_heartbeat_ms in struct watchdog_device
> not work for this driver ?

Thank you Guenter, I wasn't aware of min_hw_heartbeat_ms. I will see
if it helps.

I've also noticed that the same problem occur when, for example, I set
the timeout with wdctl and .stop is called too soon as the application
terminates.

>=20
> Guenter
>=20

Best regards,
Marcus Folkesson

--2q1nT7SaNg0lW3uu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmeaRKYACgkQiIBOb1ld
UjLI/BAAoL5n/58Y3tsCoW2ohJKVZaez8eGCACIqHRNDaQ75C7P2HH663TfdavwC
dsid6bR/uQj8xWW+hLD67sn21N3pWhxRrtqouJzkJQy9fWntrMRv39yKscpvxzz/
7qe5pg81l2Yg7HMXX6ocwuEGYqXlodUENhPCScEK2h5P7daDab176AJtjaJY4F8s
qy/mRnHdYGYJKC6ZFCPdPc35ivtcCxJ4QqvX6mqDguxgUN/VAOfri1d8ADCJYDgM
w2w7+MiXyZDLFgutjDvFkVI7mNHKAFFDgvECwsAvCI2NMrJ1rQRxCHIakO1Kh3Wr
P2v5sUA1KLsx81TduthnPe+HNs5J3Ka2MQf+YkjANWHWTHTjzb1kijvZ8Zf8neka
B01kbvTOhzCOV34XADiTniOzhqvxhvh2LN6T7qGCLJjFWplzjeG08DH+3XA66A6S
L8+ZRXLMlsiN/UHZ6ky7gDIAEDVp2QRlYPCIFZ38uFlh9jmwJ7lvgtQ+sj17cQUK
XaB7A6vYu1Q3hUfdldi8XcbGwv+IgCRBTEA7taWpD+KIMM3Qh+u19jorHI6TKS/z
yOwo7kz90oTif/mQXAyVpclq6YzGpZuIGHnKUgKw9HgtYe/eCpbwseAqEqpoAQJQ
tahJFLl4yPrxYOPXahUk4cCWc2dMRm5y6CjBX7VVeddapBevSpI=
=VQU7
-----END PGP SIGNATURE-----

--2q1nT7SaNg0lW3uu--

