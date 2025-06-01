Return-Path: <linux-watchdog+bounces-3600-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63945ACA063
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Jun 2025 22:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 938EB188D8D9
	for <lists+linux-watchdog@lfdr.de>; Sun,  1 Jun 2025 20:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A4D27DA95;
	Sun,  1 Jun 2025 20:17:03 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fgw20-7.mail.saunalahti.fi (fgw20-7.mail.saunalahti.fi [62.142.5.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93888A923
	for <linux-watchdog@vger.kernel.org>; Sun,  1 Jun 2025 20:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748809023; cv=none; b=Wo4IIZvleXFzhGCxsFlRA9ylWwPxFk7uc3IIbBf0rhgSJHm3nfT01vxoXz8C72N+wOmzZngd5P/GY0wScdHJl4gcKsaPiWLHlNT2nXwUYGAiaV2b2c/0VzyfPicDwH/YS+aT3QQI6m4jYy74HCeZ0piplRfIZB30hlbschnN6fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748809023; c=relaxed/simple;
	bh=8PKyOPYnfNSjR7FPJGszGOBmLeOkqRohGMI593pMfuo=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BlODko2+gpOvehRag6s6p/P2M8lzBccRi8R7EdBjJ+PpCffYCrCZc4Fe3k6kUcRdCt9wEUFBg+YqgeoB1nVOJ4HaqWlrIzmUyUZNTIWmrfk1SFHGXkTaCYjrM5dY4FFrhK5rqBfU6xDb8z2JyKq+0CKKXHsKr8mhX3V+qEy59QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-232.elisa-laajakaista.fi [88.113.26.232])
	by fgw21.mail.saunalahti.fi (Halon) with ESMTP
	id 35cea866-3f25-11f0-9706-005056bdd08f;
	Sun, 01 Jun 2025 23:15:50 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 1 Jun 2025 23:15:49 +0300
To: Diogo Ivo <diogo.ivo@siemens.com>, mika.westerberg@linux.intel.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-watchdog@vger.kernel.org,
	jan.kiszka@siemens.com, benedikt.niedermayr@siemens.com
Subject: Re: [PATCH v3 0/2] Add driver for Intel Over-Clocking Watchdog
Message-ID: <aDy09SFPkzr2AJnr@surfacebook.localdomain>
References: <20250317-ivo-intel_oc_wdt-v3-0-32c396f4eefd@siemens.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317-ivo-intel_oc_wdt-v3-0-32c396f4eefd@siemens.com>

Mon, Mar 17, 2025 at 10:55:05AM +0000, Diogo Ivo kirjoitti:

+ Mika

> This series adds a driver for the Intel Over-Clocking Watchdog found in
> the Intel Platform Controller Hub (PCH).
> 
> This watchdog is controlled via a simple single-register interface and
> would otherwise be standard except for the presence of a LOCK bit that
> can only be set once per power cycle, needing extra handling around it.
> 
> Due to the way these devices are described in ACPI tables with both the
> generic PNP0C02 CID and a more detailed ACPI HID we also need to add
> their HIDs to the list of known non-PNP devices. As there are several HIDs
> for what seems to be essentially the same hardware but I don't know all
> the possible HIDs this series does not include an exhaustive list of all
> such HIDs, only those that I could personally test.

This doesn't describe why we need the driver. We have established ACPI WDAT
table. Can't you utilise it by providing in the firmware?

-- 
With Best Regards,
Andy Shevchenko



