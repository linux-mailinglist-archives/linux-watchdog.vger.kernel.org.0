Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95ADB31CBD6
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Feb 2021 15:26:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbhBPO0C (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 16 Feb 2021 09:26:02 -0500
Received: from mga17.intel.com ([192.55.52.151]:53079 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229945AbhBPOZy (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 16 Feb 2021 09:25:54 -0500
IronPort-SDR: Au8LaDzCIbEJZYRek32bByJOhZSGcLCmGcNoeDdWtImIGSGJMB34LAPZcbuo6jRzP9sAMB4xQH
 lxTudE3sJ3zA==
X-IronPort-AV: E=McAfee;i="6000,8403,9896"; a="162662490"
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="162662490"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 06:24:06 -0800
IronPort-SDR: 8LH7bt3DnpEZ4KiY/cv1/AQWfFR/dhd+iAemSvYIrK4ZWA1TMrHV3pFRssycghuXEUhfuPf0vA
 LG9I6rJNeiWQ==
X-IronPort-AV: E=Sophos;i="5.81,183,1610438400"; 
   d="scan'208";a="384407943"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2021 06:24:04 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 16 Feb 2021 16:24:01 +0200
Date:   Tue, 16 Feb 2021 16:24:01 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] watchdog: wdat_wdg: fix typo
Message-ID: <20210216142401.GF2542@lahna.fi.intel.com>
References: <20210216141727.641224-1-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210216141727.641224-1-f.suligoi@asem.it>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Tue, Feb 16, 2021 at 03:17:27PM +0100, Flavio Suligoi wrote:
> Fix the following typo:
> 
> "recommeded" --> "recommended"
> "firmare"    --> "firmware"
> 
> Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
