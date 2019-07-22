Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF0B70830
	for <lists+linux-watchdog@lfdr.de>; Mon, 22 Jul 2019 20:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726405AbfGVSMS (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 22 Jul 2019 14:12:18 -0400
Received: from valentin-vidic.from.hr ([94.229.67.141]:56825 "EHLO
        valentin-vidic.from.hr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfGVSMR (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 22 Jul 2019 14:12:17 -0400
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
        id 1BBFC3A33C; Mon, 22 Jul 2019 20:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
        d=valentin-vidic.from.hr; s=2017; t=1563819129;
        bh=mQlsxzBS9i7ZF/gLh0X/hrvCfdCo0RpsY9PFknbbRHQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YgoqI3HHSzDX9Dn58Pu9mYuHPyezgPBYwoWI6Tg0twNQqKnC61BspV3GMpqe4nRFF
         1r+A0CetzREu/8sl9akCb+cLOBsN8/4AHNrN94qwukp6tQDlSUkpYMpP5R/9WdhYy0
         p9t32K56u5eT09FaPYmvN+xa/amN7Wk9fjuJ9THNk0fCeQ6qyJeOd7uMjeYnlF6vfG
         nisC7ViP1AwrVBEY9HEcucQV91wYh0foUQ0cnkHyNO67GG7TZ5/CeP3xl9B598VMkE
         n3ZIc5c0Eyhf5uYD9eiDlYdof03WEvaQDwMZ0PRz/WjWFCFekrMdEIQEtdkaDEBHu4
         THdZIKKO6/ifA==
Date:   Mon, 22 Jul 2019 20:12:08 +0200
From:   Valentin =?utf-8?B?VmlkacSH?= <vvidic@valentin-vidic.from.hr>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-watchdog@vger.kernel.org
Subject: Re: iTCO_wdt on Intel NUC
Message-ID: <20190722181208.ghpc2nxolhyxoh6n@valentin-vidic.from.hr>
References: <20190721203047.3jd6slko6guz52fl@valentin-vidic.from.hr>
 <d2f78a10-df19-9922-565d-b0ed6fcacb67@roeck-us.net>
 <20190722045557.tndjp4hnpngvlaql@valentin-vidic.from.hr>
 <20190722154549.GA5166@roeck-us.net>
 <20190722161026.3bzxwibivomuysqf@valentin-vidic.from.hr>
 <20190722162152.GB8122@roeck-us.net>
 <20190722174129.qzlg5exwx5ns3fkw@valentin-vidic.from.hr>
 <20190722175203.GA12554@roeck-us.net>
 <20190722175658.vipkznf2pnegwtyk@valentin-vidic.from.hr>
 <20190722180310.GA13365@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190722180310.GA13365@roeck-us.net>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Jul 22, 2019 at 11:03:10AM -0700, Guenter Roeck wrote:
> No idea, sorry. I don't have the system, and I have no means to debug it.
> The authors of the code in i2c_i801 might be able to help.

Sure, I will try to contact the authors and linux-i2c list.

Thanks for the help,
Valentin
