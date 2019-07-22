Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90843707FC
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 19:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730988AbfGVR5E (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 13:57:04 -0400
Received: from valentin-vidic.from.hr ([94.229.67.141]:53589 "EHLO
        valentin-vidic.from.hr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731277AbfGVR5D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 13:57:03 -0400
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
        id 198393A33E; Mon, 22 Jul 2019 19:56:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=valentin-vidic.from.hr; s=2017; t=1563818219;
        bh=Y6yUWw0XmdFdNbEK+W+Q5PEO6mJ6rRwpABkzKKozzds=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WTdjzDx9r2PypIFO4zqua/IbSwCbpegA7M7rMcjYGB2MNfoY0VS0ZjU42snmQLtOs
         qWZdrkc2pv/0MeIV+zJnUeXGTfoi/1D+GVtccqrNHCg5dsOHOBz7o4p5nv6TZBe0Ni
         jX5f/HV58xWb1f5eN30zIarH1km7ZJ99/sZt2rNZFpFew6I2ey1hfTbQkBCQIlp3ql
         sq3WbDyIiQ57FROPkOMc/l4eUV29S4wqhGFMFMCroPpOOTgPZIR3WUCf5sUzHzMTEr
         A7ROqLZTupqi1wIhzkXLgUgPObHKPHTMpm41HRACaF9vqRSZyFWJnfYQlDskY7B/fX
         SRhvCAHgx2AnQ==
Date:   Mon, 22 Jul 2019 19:56:58 +0200
From:   Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190722175658.vipkznf2pnegwtyk@valentin-vidic.from.hr>
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
 <20190722045557.tndjp4hnpngvlaql@valentin-vidic.from.hr>
 <20190722154549.GA5166@roeck-us.net>
 <20190722161026.3bzxwibivomuysqf@valentin-vidic.from.hr>
 <20190722162152.GB8122@roeck-us.net>
 <20190722174129.qzlg5exwx5ns3fkw@valentin-vidic.from.hr>
 <20190722175203.GA12554@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722175203.GA12554@roeck-us.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 22, 2019 at 10:52:03AM -0700, Guenter Roeck wrote:
> Is this the first mention of iTCO_wdt in the log ?
> The easiest explanation that this point would be that lpc_ich instantiates
> iTCO_wdt as well.

I have removed lpc_ich and the other relevant modules and than try to
load i2c_i801. It seems to me that perhaps i2c_i801 passes the wrong
parameters to iTCO_wdt or something like that?

-- 
Valentin
