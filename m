Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82FA16F8A0
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 06:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727810AbfGVE4F (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 00:56:05 -0400
Received: from valentin-vidic.from.hr ([94.229.67.141]:54299 "EHLO
        valentin-vidic.from.hr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727718AbfGVE4F (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 00:56:05 -0400
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
        id B9B6C3A33C; Mon, 22 Jul 2019 06:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=valentin-vidic.from.hr; s=2017; t=1563771357;
        bh=10pILHKkY5Hkq7shAjFiO+/O0d1QAjLmN2U0FPyfpe8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DKUaQXlFUd0y9WKsrazcg3KkQpNiHeqIHye87AEG+32NV5+X2kEMU0OTpIV0vQPwQ
         EOpoDJFOZlKkGgXbT9HmBGlV1clmkRsPThqe45QRItjxZ23jaY82Wsd3TEzfht9XA6
         jfCZAIXzJq8HQtgZnnIE3j6LdKPy2ZKYWCV6Q2YkZYB51GkQ3JF8IsFqElanvFhpum
         VPkv7Bc8w5pPqtWW9HMOFiMI3UZk4Oi9e+Xbzh1q21zYX3hPcTXld7JhE9jdBDkhTu
         2gA3NQMg6JsODxJ+pqrEKxVkvxIjLWGYceWFxjQgQXh1r3MB6dNLg0KsiA+AT/CGgi
         kOsK7aIHkUh6g==
Date:   Mon, 22 Jul 2019 06:55:57 +0200
From:   Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190722045557.tndjp4hnpngvlaql@valentin-vidic.from.hr>
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Sun, Jul 21, 2019 at 05:05:17PM -0700, Guenter Roeck wrote:
> Most likely the memory region is reserved/used by something else. /proc/iomem
> might show you.

The output is a bit strange since it mentions iTCO_wdt for that address range:

[    9.377397] iTCO_wdt iTCO_wdt: can't request region for resource [mem 0x00c5fffc-0x00c5ffff]

00000000-00000fff : Reserved
00001000-0009efff : System RAM
0009f000-000fffff : Reserved
  000a0000-000bffff : PCI Bus 0000:00
  000e0000-000e3fff : PCI Bus 0000:00
  000e4000-000e7fff : PCI Bus 0000:00
  000e8000-000ebfff : PCI Bus 0000:00
  000ec000-000effff : PCI Bus 0000:00
  000f0000-000fffff : System ROM
00100000-6f8d8017 : System RAM
  00c5fffc-00c5ffff : iTCO_wdt
6f8d8018-6f8e8e57 : System RAM
6f8e8e58-79d52fff : System RAM
79d53000-7a1bdfff : Reserved
7a1be000-7a23afff : ACPI Tables
7a23b000-7a2ebfff : ACPI Non-volatile Storage
7a2ec000-7ac0dfff : Reserved
7ac0e000-7ac0efff : System RAM
7ac0f000-7fffffff : Reserved
  7c000000-7fffffff : Graphics Stolen Memory

-- 
Valentin
