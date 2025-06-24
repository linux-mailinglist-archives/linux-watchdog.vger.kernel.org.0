Return-Path: <linux-watchdog+bounces-3710-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AECAE703A
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 21:58:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE4015A162A
	for <lists+linux-watchdog@lfdr.de>; Tue, 24 Jun 2025 19:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5358D2C3761;
	Tue, 24 Jun 2025 19:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="qlGhK6AP"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80713233704;
	Tue, 24 Jun 2025 19:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750795111; cv=none; b=hQgAVtmuV3M7q6SexO4a+66nKKeKDuwGc8wrlj9EQhe7itvpkhpLRjiD+ScUrjcTMgvdXQbR8+Ye8+swkbpwUszpsoaz3C+XGtLfsy1/HqEJWVUFgg2YV95y3rcWbr/MC44sKgujVlJfOXyh8xXe43YGPy8FA4tdo9kYKZI17CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750795111; c=relaxed/simple;
	bh=j0vyV5ZmzurIYUrPHsurEPqH/5kj2C4t7I1/Lljwchs=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bZoBTRkr8EAXF+3L8QRiehGQrd3w4wosES/g8MsTX0kxFUIKyN8RQVxbT4fbdm4SQNmMeP6z5MHGPmkNq+4299Ja8LqulTyjC3xvCyrbo/X/Hx1z0SZjPyHJVHpm8wQZlTxbI4viuqRZGTVkZbffSj4GwDVMPqYsQ6PSfY57UzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=qlGhK6AP; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55OJwDXV1948702;
	Tue, 24 Jun 2025 14:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750795093;
	bh=j0vyV5ZmzurIYUrPHsurEPqH/5kj2C4t7I1/Lljwchs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=qlGhK6APXZqIsnO7iYTlc8TdmTa7/XSSCw0lg39j7fQKlh18BIOGEJVqU3GrEiXou
	 8GDjfVX5DrKKJkM8VCp3GOkYfCpH8qyuEHdF9aszxWddTgiCVXawSn/e0PajHAAfpg
	 //XbkfN998Q5lV5KqHgsmgYVn6uG1a2fWUR4zjfI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55OJwDsn1846791
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 24 Jun 2025 14:58:13 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 24
 Jun 2025 14:58:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 24 Jun 2025 14:58:13 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55OJwD7F2340216;
	Tue, 24 Jun 2025 14:58:13 -0500
Message-ID: <14f89780-87b4-4ade-98db-08e2a1a123c7@ti.com>
Date: Tue, 24 Jun 2025 14:58:13 -0500
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add reaction control in rti
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: Tero Kristo <t-kristo@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250624194509.1314095-1-jm@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250624194509.1314095-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi all,

On 6/24/25 2:45 PM, Judith Mendez wrote:
> This allows for reaction control in rti driver. Since AM62L SoC [0]
> does not have WWD reset output routed to a ESM module like all other
> K3 SoC's and has a reset signal routed to the reset HW block, add a new
> compatible for AM62L and configure reset reaction for AM62L SoC instead
> of NMI.

Please ignore these patches. I will resend with a Tero's correct email
address, sorry for the noise.

~ Judith


