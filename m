Return-Path: <linux-watchdog+bounces-4754-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42AF9CED400
	for <lists+linux-watchdog@lfdr.de>; Thu, 01 Jan 2026 18:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4CFE3006AA3
	for <lists+linux-watchdog@lfdr.de>; Thu,  1 Jan 2026 17:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66907224B04;
	Thu,  1 Jan 2026 17:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfVTA9c5"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93531A0BF1
	for <linux-watchdog@vger.kernel.org>; Thu,  1 Jan 2026 17:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767289871; cv=none; b=ti8kmig9b3Pg2tg1QWy+UAxMpdsdUeMlXlC9l2TAGOlrTr4IdWXrOGFbcfHTZxWwE3KvDIHUq7yXw8tGnprdXkir8HfPjlJj7l/fhU6K01a8+sKw9PwzcTL2U2WvYUKQeT3Z9NBvFBrCW9SCVQGEaaap48X9ku6XK4T4hhXa08A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767289871; c=relaxed/simple;
	bh=+SuxnZuOwBtnUHrco5G/8HwaRgy8Mmuz80am3+gdY0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XT2TAktED+Ku1vlwptkRIlcUVhER3UZzzsUDMC/PQ/j2dm0fvsPiwEa9+aECi1GILCLUxAR334OK150jNNOrupyQlxCOMvNddHa2xI06GxjP+U8Q3Zif1Anpp0MKi8lH6kVXyDamiZ7p5W8VMwd0fz03d9nX1RdLIXjctU0GFHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfVTA9c5; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso13609929b3a.2
        for <linux-watchdog@vger.kernel.org>; Thu, 01 Jan 2026 09:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767289869; x=1767894669; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jj51h0hnz/QKxpvGSIa9Sv1MaE6xhEm5WI7a6VOKxg=;
        b=hfVTA9c5BPfPqSosNllmgPzi0PXxb1Gq4qzIn1NDH4v/XCQ4Hh3FWJCTBxEnEa8nN4
         kmC3lV5kbnfErKmPqgFUjewD85RSbeDA7qFJS+0Z28fRraghdLuIadguaR7qutcMsD+g
         fOJ3GP6JRvmkC4FC65vZ02hblMTeOzdY0af8qVjI5iLdH/MuN/KT1bAc3lmBqlg8fmRK
         SL+BlKn2McE1OKcNzAGQ3eRPLfEpKiw5n9a3GYWC8+KmQEsx+qBFBN6nABbGAzCKtAUy
         rIVfr7dDIRG+F9TRqwLAWD/q+JUZRBvLW4FlK3aZin+zQ84sBmAX4/dp5kZ57v0csLga
         Shug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767289869; x=1767894669;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jj51h0hnz/QKxpvGSIa9Sv1MaE6xhEm5WI7a6VOKxg=;
        b=xHjBPp3/bmqtdzl2gN2prOkMZ3Kef9bdP9GuUCQYOXGSSgiYw5Ap0akkGYTWrTo8F2
         vOkZ30TVB38qsfatWrvppuOHtkBH+4WKYqpKffD9+1GC2Yd5J7r6y/ZpbVi4LuOIwse9
         73KIYTbzD5cLMZ3fqQRNfxKMq/3Yu6sDToFaCurMmseCNwTAtQquHnWqd2X7+19DvUtP
         D8/v4eGmLZlOBE0aYpPyT75V8HX5Qvyok+Y8BEABtA4/lgsp+KofUyRWf+P1RUlXilV7
         RWj2q7438ciZn1YOTCDYOh5X1tzG1AhJ9TVfqdUNkhuSNQLq4FU2ICt8dqGCwp+owJqa
         mK+A==
X-Forwarded-Encrypted: i=1; AJvYcCULU3F+I+UovMFihwRidlMZ7R3VLFGuTo4u/gbdx/KpbBGf1eQUSJXwCltM5fbj6u5JciIxn/ThYA/+jXI2Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQieWokNbiCi2rfOizrMJOkn0B+hqm0qOu3pfN7z85Ocnv6Ay5
	EitaL+E+se30lslgAsrXb9xWmiHAiNhC6jU5u52B4ou/efezdp7A/tW1
X-Gm-Gg: AY/fxX5flBvUTSiHRAaBHXlArWCcQHVNXAAw6iUCzdaPb9MP2QYSpDLluMX5K3UxHlj
	6C8F8sbNF45XrNHhCkasPN3ONjJos4ionIbeQoUC7y8cdEkPgAfbcmzrY9Xcyrtl0tWVGa/4JKC
	JKHL0tV4tT9siwMDZu6IfWsS0izl9MkqRtSQ+QJDvKAJ+907njdoDPnvnmwtQpbFs2zr2UKCTr/
	xArZ0ga2gMOKDrXBva1S/T6mZeQFMPYa7ZYkGameH3qOqJSQRGyUHQNp4H77CmGT1J7Bv8Ixlc8
	kNOxPIOUwa9VIP7V8LjsGqvcnL1d9ahwaDQh1qGEgo5BHpgLSDFj0BbVcllvlTR+edA6xggC+e0
	JHYQqo4attXrpUJeUCpZyKJw6HJTRtNCnD6kSjTjjdefdmihkIQ3XsYV5XCCpsHBk/Jvwtn5EKv
	zzsAjplbFSz4UVa8fA0CCsH/or
X-Google-Smtp-Source: AGHT+IFsQJ4bAmzJ+Reis0EcfO56892m2Lru8k+ihnYSVUjClPj1CJFSHdmj8mSH6IKO+AaaRLP9dQ==
X-Received: by 2002:a05:7022:42a4:b0:11a:fe6f:806a with SMTP id a92af1059eb24-121722f65a3mr42792371c88.31.1767289869024;
        Thu, 01 Jan 2026 09:51:09 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254c734sm152212026c88.13.2026.01.01.09.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 09:51:08 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 1 Jan 2026 09:51:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: j.ne@posteo.net
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3] dt-bindings: watchdog: Convert mpc8xxx-wdt to
 YAML
Message-ID: <74226532-e501-414e-87a3-5a1b54e0b9fd@roeck-us.net>
References: <20260101-ppcyaml-wdt-v3-1-9d59c5aee03f@posteo.net>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260101-ppcyaml-wdt-v3-1-9d59c5aee03f@posteo.net>

On Thu, Jan 01, 2026 at 05:54:22PM +0100, J. Neuschäfer via B4 Relay wrote:
> From: "J. Neuschäfer" <j.ne@posteo.net>
> 
> Convert mpc83xx-wdt.txt to YAML to enable automatic schema validation.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: J. Neuschäfer <j.ne@posteo.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

