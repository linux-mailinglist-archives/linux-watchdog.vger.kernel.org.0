Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B29AC41D2
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Oct 2019 22:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbfJAUde (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 1 Oct 2019 16:33:34 -0400
Received: from mga12.intel.com ([192.55.52.136]:2322 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbfJAUde (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 1 Oct 2019 16:33:34 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 01 Oct 2019 13:33:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,571,1559545200"; 
   d="scan'208";a="194643697"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 01 Oct 2019 13:33:32 -0700
Received: from andy by smile with local (Exim 4.92.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1iFOpH-0005Bj-6z; Tue, 01 Oct 2019 23:32:51 +0300
Date:   Tue, 1 Oct 2019 23:32:51 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     razvan becheriu <razvan.becheriu@gmail.com>
Cc:     Razvan Becheriu <razvan.becheriu@qualitance.com>,
        linux-watchdog@vger.kernel.org,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ferry Toth <fntoth@gmail.com>
Subject: Re: [PATCH v1] watchdog: intel-mid_wdt: Add WATCHDOG_NOWAYOUT support
Message-ID: <20191001203251.GT32742@smile.fi.intel.com>
References: <20190924143116.69823-1-andriy.shevchenko@linux.intel.com>
 <CAJAoKi8aRHyySUM1mcuub_tgmE7fdLgRyajYF=fUf6QH0PvZPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJAoKi8aRHyySUM1mcuub_tgmE7fdLgRyajYF=fUf6QH0PvZPA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Oct 01, 2019 at 10:08:53PM +0300, razvan becheriu wrote:
> PS: sry for sending this several times, I get a message like:
> Message may contain a virus
> Your message wasn't delivered to linux-watchdog@vger.kernel.org because it
> may contain a virus. Learn how to check for and prevent viruses.

You need to send the message as plain text. You may test yourself without
spamming people by sending to some other address which you have access to.

All there messages I got have HTML part. Usually it shows MUA misconfiguration.

-- 
With Best Regards,
Andy Shevchenko


