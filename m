Return-Path: <linux-watchdog+bounces-3808-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB37DAF1547
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 14:18:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F24F57AF0E1
	for <lists+linux-watchdog@lfdr.de>; Wed,  2 Jul 2025 12:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D1D26E713;
	Wed,  2 Jul 2025 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="y6w8RrXR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from outbound.pv.icloud.com (p-west1-cluster5-host2-snip4-4.eps.apple.com [57.103.66.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F1823D2A3
	for <linux-watchdog@vger.kernel.org>; Wed,  2 Jul 2025 12:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458436; cv=none; b=deYB7lKMllfbtCahgDTdrPQvmu6UE//8z+/oHY15cjETFi+P0BbepqebjCDG70b23Oa78LI3Wx8+WP+cU3kBFJfNuuHOg844yeVSoai4MDSYHIBgiWUxvGNOSzx7hbwiV4ze/T257+GrCH0OxjQx2MEyEDsDMTtM5MLjcM2q1sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458436; c=relaxed/simple;
	bh=z5r5omQDIB75IOb6AfWP+DA0/YsBNTo3kExon87ZnIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Su2gwER9HuBRD7JpUW0pLQNcsHiZR36sFzZzm3/iwdd54Gg5anlCxU0JqCV2fDc8CN+Io/PVCGEv8xNMgHJfzAOojNZ4Gm1s8lgT6DpwIfJXgv3g/Jv81/hhzCnhgHR+3TULKW7T86OxQzepm8Tn5kjCrWaJUhH7OcgHKdQ/ST4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=y6w8RrXR; arc=none smtp.client-ip=57.103.66.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=nx1rqPjRDWMcBL6mO8RCi2ZS4yd6jmTSXbCncrmU2H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=y6w8RrXReeMtQhrhFjNfW05uzIPf2utTIyzOEOH3R3cO6WY5zD6Hh3FvuqXRIN+JI
	 exVO6nLmJVunBKlZTZA+j377t6Q6/9g8FOH5ac2USnCUCCJ4R2boAGvsVaN3rd3gOV
	 xhkYWzHfTQCe5PYq6tEW5NG7oEhHEpnInw/A35x/bCBqYEuoFCRt7veNYN2OfsEJ3r
	 BkomBIwUJ1k3SnGgnsdUOttTISOifp494zHLolInjHzqs9rG6DC4++1Lf9uZpuQSHr
	 uXyponpA5KV6XFDX9zShshyzGEzGcv2aBYOoKZvUWZzCFeSs4lIZP7Sdq3gmb2K9zN
	 YbziWUTXr3OkA==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 9CC7418000A5;
	Wed,  2 Jul 2025 12:13:50 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id A9F4618006CA;
	Wed,  2 Jul 2025 12:13:46 +0000 (UTC)
Message-ID: <684f00b4-9161-4bca-a94c-8c44577bafca@icloud.com>
Date: Wed, 2 Jul 2025 20:13:43 +0800
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] char: misc: Allocate 4 more fixed minors for
 watchdog
To: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rudolf Marek <r.marek@assembler.cz>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, "David S . Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-parisc@vger.kernel.org,
 sparclinux@vger.kernel.org, Zijun Hu <zijun.hu@oss.qualcomm.com>
References: <20250701-rfc_miscdev-v2-0-3eb22bf533be@oss.qualcomm.com>
 <20250701-rfc_miscdev-v2-7-3eb22bf533be@oss.qualcomm.com>
 <ad90af20-33f4-40e3-b08a-ce34437174db@app.fastmail.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <ad90af20-33f4-40e3-b08a-ce34437174db@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA5OSBTYWx0ZWRfX1kiPS+dNVdGx
 3C3DRPeKtRehbDIou2UVMmBzxTBjC0iBR43rQMQkeMK0d15Zmnc77Nr61h9JkRCTu99D8bcRslW
 GJmv4GAVisICrObsAbk0StQs0vpzTgDOlYdaYBHhVj0G1mCyvHmKBvYHD8ZMsurhzYNMmiJCYB2
 jgQagR7dW3XsmnUpi+2/fpP9RSPjDc6D1Qdu/MpGHpVAoWt/rmFhVOLpM/JWNH9HoUbjnuly/ov
 QHb4lUN92FcJv/Pv9Z1NlEbDQjwO82OzwgzrL36Rs/sstgCRjIO85OPIHt/1mJ/3beUxZKt4E=
X-Proofpoint-GUID: p6hyq69xJcvGXaISkohW_VeIJaHzQU0r
X-Proofpoint-ORIG-GUID: p6hyq69xJcvGXaISkohW_VeIJaHzQU0r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 mlxscore=0
 adultscore=0 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507020099

On 2025/7/2 02:45, Arnd Bergmann wrote:
> On Tue, Jul 1, 2025, at 17:24, Zijun Hu wrote:
>> From: Zijun Hu <zijun.hu@oss.qualcomm.com>
>>
>> There are drivers which needs more fixed minors for watchdog, but
>> watchdog only has one fixed minor currently, it causes hardcoded and
>> unregistered fixed minors are used by these drivers.
>>
>> Allocate 4 more fixed minors and apply for these drivers.
> 
> Missing signoff?

my mistake. thank you for pointing out.

> 
> 
> I don't think this is the right fix here, these drivers implement
> the normal watchdog API, so they should not even call misc_register
> but should instead call watchdog_dev_register().
> 

agree

Documentation/watchdog/convert_drivers_to_kernel_api.rst indeed suggests
convert old watchdog implementation to new one using watchdog framework.

> Obviously doing this right is a bigger change, so maybe the simpler
> answer is to use dynamic minors instead of the nonstandard ones.
> 
yes. it is feasible.

> FWIW, I double-checked to see whether there are any in-tree
> references to these two drivers, and there is one each:
> 
> drivers/i2c/busses/i2c-i801.c:	{ "Hermes", DMI_DEV_TYPE_OTHER, 0x73, "fscher" },
> drivers/i2c/busses/i2c-i801.c:	{ "Hades",  DMI_DEV_TYPE_OTHER, 0x73, "fschds" },
> drivers/i2c/busses/i2c-i801.c:	{ "Syleus", DMI_DEV_TYPE_OTHER, 0x73, "fscsyl" },
> arch/powerpc/boot/dts/fsl/t4240rdb.dts:                         compatible = "winbond,w83793";
> 
> These were added in 2009 and 2016, respectively, so the hardware
> is probably around somewhere but quite hard to find.
> 

let me drop this change in next revision.
may try to convert them by following the guidance at my spare time.

>     Arnd


