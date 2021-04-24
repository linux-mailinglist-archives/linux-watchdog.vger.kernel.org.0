Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8D0B36A0AB
	for <lists+linux-watchdog@lfdr.de>; Sat, 24 Apr 2021 12:46:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234643AbhDXKrJ (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sat, 24 Apr 2021 06:47:09 -0400
Received: from jptosegrel01.sonyericsson.com ([124.215.201.71]:6262 "EHLO
        JPTOSEGREL01.sonyericsson.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234715AbhDXKrH (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sat, 24 Apr 2021 06:47:07 -0400
X-Greylist: delayed 1212 seconds by postgrey-1.27 at vger.kernel.org; Sat, 24 Apr 2021 06:47:07 EDT
From:   Peter Enderborg <peter.enderborg@sony.com>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mm@kvack.org>, Shakeel Butt <shakeelb@google.com>
Subject: [RFC PATCH] watchdog: Adding softwatchdog
Date:   Sat, 24 Apr 2021 12:25:54 +0200
Message-ID: <20210424102555.28203-1-peter.enderborg@sony.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-SEG-SpamProfiler-Analysis: v=2.3 cv=DLnxHBFb c=1 sm=1 tr=0 a=fZcToFWbXLKijqHhjJ02CA==:117 a=3YhXtTcJ-WEA:10 a=TSGv57Xde0NnBCbwJi0A:9
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

First it is not a new softdog.
This adds function that do other actions than a reboot. It intended to be
used to help userspace management and monitoring going but can
be used standalone too.

The idea is to use watchdog interface, instead of reboot, a timer
function do a softer action. In this case it is using oom_score_adj
to pick a task to kill. So this is assuming that watchdog kicker
is not respoding due to high memory pressure. A other usecase might
be a selecting a task from a UID or what ever is problematic,
it does not have to be a memory issue.
But core thing is to have other actions than hard reboot.

The patch need more works, but it can be tested as it is.
