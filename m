Return-Path: <linux-watchdog+bounces-1176-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E504E9100A7
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2024 11:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E934B1C219D1
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Jun 2024 09:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A90E21A4F33;
	Thu, 20 Jun 2024 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DH0JIsAR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF221A4F2A;
	Thu, 20 Jun 2024 09:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718876586; cv=none; b=L1VbARHLAfSFO1Mn4VyvAxPG/c/m4JmfwubDM1vOMa2dlZuuTP6uO534ULgCnIhGKDS+CxQteF1xx4mp4y+JbtWYZ3fZkt8h/IwSo/mO0KoupomvfJffOCT8wmR0OyE28yVcObeaQORs2dgHbfAqTbrc6MqbYcq6tYvdbgo7tQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718876586; c=relaxed/simple;
	bh=bklmteL2Us6hnqT4H7O515iTYU/jwLP/rRnmtQKDPEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Th/RiXil3WkM1w6+d9vIXFUbWLHmt50RrDXOLZuLDPMNmnpjz/IZ6ZRVGh+nvJO9AQQrLZLFnWLhxApsU0NwtyqxvqNDNnLT/I7kPqU5d+/NFmMdYQaQWrqm0H7wi1lD/ESQXXem2h3/Mm3ym1f3n3A0Vtmhy1LzqBeAMzPaWRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DH0JIsAR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B70DC2BD10;
	Thu, 20 Jun 2024 09:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718876586;
	bh=bklmteL2Us6hnqT4H7O515iTYU/jwLP/rRnmtQKDPEc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DH0JIsAR7gvivHoRbIC1ZL9lQZKM8CAPOtU8pGQhrB6Sq2cxyWc3fyclMCeT/HiB7
	 fTge+o1qidamOGA4skHFzGSsyNX/qwuMyR7E3RXo70ITlz8k0fjwcGn7ao0v1JbNw5
	 2EmG+RcHg0bvVsK7oVfWylIExG6fkwVTPktn6543MyIfqdPmBmKgstbN0pVduOOqNZ
	 vLzI9k8JVlF9uWaNIXG3Rpxyr1HqRRS7cEXn2K2V0NoQGJYaN7XZ4wWKNY8Nx6cZYR
	 kBAoPb++jK/VDLVfBGV5wIgm5nNygAlO7WSKFbQLTjwagCiIL3A8boTd3z3crqRZQh
	 0J4Kpb9p+OXyA==
Date: Thu, 20 Jun 2024 10:43:00 +0100
From: Lee Jones <lee@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v4 0/6] Support ROHM BD96801 Scalable PMIC
Message-ID: <20240620094300.GA1123342@google.com>
References: <cover.1718356964.git.mazziesaccount@gmail.com>
 <171887615676.1119049.7678370393770067068.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <171887615676.1119049.7678370393770067068.b4-ty@kernel.org>

On Thu, 20 Jun 2024, Lee Jones wrote:

> On Fri, 14 Jun 2024 12:42:35 +0300, Matti Vaittinen wrote:
> > Support ROHM BD96801 Scalable PMIC
> > 
> > The ROHM BD96801 is automotive grade PMIC, intended to be usable in
> > multiple solutions. The BD96801 can be used as a stand-alone, or together
> > with separate 'companion PMICs'. This modular approach aims to make this
> > PMIC suitable for various use-cases.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/6] dt-bindings: ROHM BD96801 PMIC regulators
>       commit: 7edf20a5380779dd47e72b68e7cfa037dfd0807d
> [2/6] dt-bindings: mfd: bd96801 PMIC core
>       commit: ef0c63e3e22d4c9039831236e3b189caf538b4c0
> [3/6] mfd: support ROHM BD96801 PMIC core
>       commit: d701779ed5effdb55b8f08051ed1c5291fb9201c
> [4/6] regulator: bd96801: ROHM BD96801 PMIC regulators
>       commit: 79ab65717405d535b96a7bbf04eb8c71f9372985
> [5/6] watchdog: ROHM BD96801 PMIC WDG driver
>       commit: 10278981a2fb81fb07635b9649f6387f6a6a5abf
> [6/6] MAINTAINERS: Add ROHM BD96801 'scalable PMIC' entries
>       commit: de9fa7d755fd0c5f90c5faa524db0cc13efd809e

Submitted for TuxSuite testing.

If all is good, I'll submit a PR to the other maintainers shortly.

-- 
Lee Jones [李琼斯]

